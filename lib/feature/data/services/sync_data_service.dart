import 'dart:async';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spira/feature/data/datasources/local/local_data_source.dart';
import 'package:spira/feature/data/model/request/patient_model.dart';
import 'package:spira/feature/data/services/connectivity_service.dart';
import 'package:spira/feature/domain/entities/Audio_response_entity.dart';
import 'package:spira/feature/domain/entities/patient_response_entity.dart';
import 'package:spira/feature/domain/usecases/post_audio_usecase.dart';
import 'package:spira/feature/domain/usecases/post_patient_data_usecase.dart';
import 'package:spira/feature/presentation/cubits/menu/menu_cubit.dart';

class SyncDataService {
  StreamSubscription<bool>? _connectivitySubscription;
  bool isSyncing = false;
  bool isCollecting = false;

  void setCollecting(bool value) {
    isCollecting = value;
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
  }

  void start() {
    if (_connectivitySubscription == null) {
      _startListening();
    }
  }

  void _startListening() {
    _connectivitySubscription = GetIt.I
        .get<ConnectivityService>()
        .connectionStatusStream
        .listen(_onConnectivityChanged);
  }

  void _onConnectivityChanged(bool connected) {
    if (connected && !isSyncing) {
      _tryToSync();
    }
  }

  Future<void> tryToSyncOnMenu() async {
    if (await GetIt.I.get<ConnectivityService>().isConnected() && !isSyncing) {
      _tryToSync(fromMenu: true);
    }
  }

  Future<void> _tryToSync({bool fromMenu = false}) async {
    GetIt.I<MenuCubit>().setIdle();
    isSyncing = true;
    List<PatientModel> patientList =
        await GetIt.I.get<LocalDataSource>().getUnsynchronizedPatients();
    if (patientList.isEmpty && !isCollecting) {
      try {
        final directory = await getExternalStorageDirectory();
        final String recordsPath = '${directory?.path}/records';
        final recordsDirectory = Directory(recordsPath);
        if (await recordsDirectory.exists()) {
          final files = recordsDirectory.listSync();
          for (var file in files) {
            if (file is File) {
              await file.delete();
            }
          }
        }
      } catch (_) {}
    } else {
      for (PatientModel patient in patientList) {
        int? id;
        try {
          if (!(patient.synchronized ?? false)) {
            id = await submitOnlineCollectionData(patient);
            if (id != null && id > 0) {
              int ambientNoise =
                  await submitAmbientNoise(id, patient.audioNoisePath!);
              int sustentainedVowel =
                  await submitSustentainedVowel(id, patient.audioVocalPath!);
              int phrase = patient.audioSentencePath != null
                  ? await submitPhrase(id, patient.audioSentencePath!)
                  : 1;
              int rhyme = await submitRhyme(id, patient.audioNurseryRhymePath!);

              patient = patient.copyWith(
                audioNoiseSynchronized: ambientNoise == 1,
                audioVocalSynchronized: sustentainedVowel == 1,
                audioSentenceSynchronized: phrase == 1,
                audioNurseryRhymeSynchronized: rhyme == 1,
                synchronized: true,
              );
              await GetIt.I.get<LocalDataSource>().updatePatient(patient);
            } else if (id == -1 && (fromMenu || !isCollecting)) {
              GetIt.I<MenuCubit>().setUnauthorized();
              break;
            }
          } else {
            id = patient.id;
            int ambientNoise =
                (patient.audioNoiseSynchronized ?? false) ? 1 : 0;
            if (!(ambientNoise == 1)) {
              ambientNoise =
                  await submitAmbientNoise(id!, patient.audioNoisePath!);
              if (ambientNoise == 1) {
                patient = patient.copyWith(
                  audioNoiseSynchronized: true,
                );
              } else if (ambientNoise == -1 && (fromMenu || !isCollecting)) {
                GetIt.I<MenuCubit>().setUnauthorized();
                break;
              }
            }
            int sustentainedVowel =
                (patient.audioVocalSynchronized ?? false) ? 1 : 0;
            if (!(sustentainedVowel == 1)) {
              sustentainedVowel =
                  await submitSustentainedVowel(id!, patient.audioVocalPath!);
              if (sustentainedVowel == 1) {
                patient = patient.copyWith(
                  audioVocalSynchronized: true,
                );
              } else if (sustentainedVowel == -1 && fromMenu) {
                GetIt.I<MenuCubit>().setUnauthorized();
                break;
              }
            }
            int phrase = (patient.audioSentenceSynchronized ?? false) ? 1 : 0;
            if (!(phrase == 1)) {
              phrase = patient.audioSentencePath != null
                  ? await submitPhrase(id!, patient.audioSentencePath!)
                  : 1;
              if (phrase == 1) {
                patient = patient.copyWith(
                  audioSentenceSynchronized: true,
                );
              } else if (phrase == -1 && fromMenu) {
                GetIt.I<MenuCubit>().setUnauthorized();
                break;
              }
            }
            int rhyme =
                (patient.audioNurseryRhymeSynchronized ?? false) ? 1 : 0;
            if (!(rhyme == 1)) {
              rhyme = await submitRhyme(id!, patient.audioNurseryRhymePath!);
              if (rhyme == 1) {
                patient = patient.copyWith(
                  audioNurseryRhymeSynchronized: true,
                );
              } else if (rhyme == -1 && (fromMenu || !isCollecting)) {
                GetIt.I<MenuCubit>().setUnauthorized();
                break;
              }
            }

            patient = patient.copyWith(
              audioNoiseSynchronized: ambientNoise == 1,
              audioVocalSynchronized: sustentainedVowel == 1,
              audioSentenceSynchronized: phrase == 1,
              audioNurseryRhymeSynchronized: rhyme == 1,
              synchronized: true,
            );
            await GetIt.I.get<LocalDataSource>().updatePatient(patient);
          }
        } catch (_) {}
      }
    }

    isSyncing = false;
  }

  Future<int?> submitOnlineCollectionData(PatientModel patient,
      {bool fromMenu = false}) async {
    final PostPatientDataUseCase postPatientDataUseCase =
        GetIt.I.get<PostPatientDataUseCase>();
    PatientResponseEntity? response =
        await postPatientDataUseCase.call(patient);
    if ((response?.success ?? false) && response?.data?.id != null) {
      return response!.data!.id!;
    } else {
      if (!(response?.authenticated ?? true)) {
        return -1;
      }
      return null;
    }
  }

  Future<int> submitAmbientNoise(int id, String audioPath,
      {bool fromMenu = false}) async {
    final PostAudioDataUseCase postAudioDataUseCase =
        GetIt.I.get<PostAudioDataUseCase>();
    AudioResponseEntity? response =
        await postAudioDataUseCase.call(id, 'ambient_noise', audioPath);

    if (response?.success ?? false) {
      return 1;
    } else {
      if (!(response?.authenticated ?? true)) {
        return -1;
      }
      return 0;
    }
  }

  Future<int> submitSustentainedVowel(int id, String audioPath,
      {bool fromMenu = false}) async {
    final PostAudioDataUseCase postAudioDataUseCase =
        GetIt.I.get<PostAudioDataUseCase>();
    AudioResponseEntity? response =
        await postAudioDataUseCase.call(id, 'sustentained_vowel', audioPath);

    if (response?.success ?? false) {
      return 1;
    } else {
      if (!(response?.authenticated ?? true)) {
        return -1;
      }
      return 0;
    }
  }

  Future<int> submitPhrase(int id, String audioPath,
      {bool fromMenu = false}) async {
    final PostAudioDataUseCase postAudioDataUseCase =
        GetIt.I.get<PostAudioDataUseCase>();
    AudioResponseEntity? response =
        await postAudioDataUseCase.call(id, 'phrase', audioPath);

    if (response?.success ?? false) {
      return 1;
    } else {
      if (!(response?.authenticated ?? true)) {
        return -1;
      }
      return 0;
    }
  }

  Future<int> submitRhyme(int id, String audioPath,
      {bool fromMenu = false}) async {
    final PostAudioDataUseCase postAudioDataUseCase =
        GetIt.I.get<PostAudioDataUseCase>();
    AudioResponseEntity? response =
        await postAudioDataUseCase.call(id, 'rhyme', audioPath);

    if (response?.success ?? false) {
      return 1;
    } else {
      if (!(response?.authenticated ?? true)) {
        return -1;
      }
      return 0;
    }
  }
}
