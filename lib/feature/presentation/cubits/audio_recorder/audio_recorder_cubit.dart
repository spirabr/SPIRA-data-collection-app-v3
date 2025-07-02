// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/recorder_audio_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';

part 'audio_recorder_state.dart';

class AudioRecorderCubit extends Cubit<AudioRecorderState> {
  AudioRecorderCubit() : super(AudioRecorderInitial());

  AudioRecorderType type = AudioRecorderType.test;

  final Codec _codec = Codec.pcm16WAV;
  String? _path;
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final PlayerController controller = PlayerController();

  Timer? _timer;

  int? maxDuration;

  BuildContext? dataCollectionCubitContext;

  Future<void> init(
      {int? maxDuration,
      AudioRecorderType? type,
      BuildContext? dataCollectionCubitContext}) async {
    if (maxDuration != null) {
      this.maxDuration = maxDuration;
    }
    if (type != null) {
      this.type = type;
    }
    await openTheRecorder();
    if (dataCollectionCubitContext != null) {
      this.dataCollectionCubitContext = dataCollectionCubitContext;
    }

    emit(AudioRecorderReady());
    checkRecorderStatus();
  }

  Future<void> checkRecorderStatus() async {
    switch (type) {
      case AudioRecorderType.test:
        break;
      case AudioRecorderType.ambientNoise:
        RecordedAudioEntity? audio = dataCollectionCubitContext
            ?.read<DataCollectionCubit>()
            .state
            .ambientNoise;
        if (audio != null) {
          _path = audio.path;
          await _preparePlayer();
          emit(AudioRecorderStopped(duration: audio.duration));
        }
        break;
      case AudioRecorderType.sustentainedVowel:
        RecordedAudioEntity? audio = dataCollectionCubitContext
            ?.read<DataCollectionCubit>()
            .state
            .sustentainedVowel;
        if (audio != null) {
          _path = audio.path;
          await _preparePlayer();
          emit(AudioRecorderStopped(duration: audio.duration));
        }
        break;
      case AudioRecorderType.phrase:
        RecordedAudioEntity? audio = dataCollectionCubitContext
            ?.read<DataCollectionCubit>()
            .state
            .phrase;
        if (audio != null) {
          _path = audio.path;
          await _preparePlayer();
          emit(AudioRecorderStopped(duration: audio.duration));
        }
        break;
      case AudioRecorderType.rhyme:
        RecordedAudioEntity? audio =
            dataCollectionCubitContext?.read<DataCollectionCubit>().state.rhyme;
        if (audio != null) {
          _path = audio.path;
          await _preparePlayer();
          emit(AudioRecorderStopped(duration: audio.duration));
        }
        break;
    }
  }

  Future _preparePlayer() async {
    if (_path != null) {
      await controller.preparePlayer(
        path: _path!,
        shouldExtractWaveform: true,
      );
    }
  }

  Future<void> openTheRecorder() async {
    Directory tempDir = await getTemporaryDirectory();
    _path = '${tempDir.path}/record_sample.wav';

    var status = await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();

    switch (status) {
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
        emit(AudioDeniedPermission(permissionStatus: status));
        throw RecordingPermissionException('Microphone permission not granted');
      default:
    }
    await _recorder.openRecorder();
  }

  Future<void> record() async {
    if (state is AudioPlayerPlaying) {
      await controller.stopPlayer();
    }
    _recorder
        .startRecorder(
      toFile: _path,
      codec: _codec,
      audioSource: AudioSource.microphone,
    )
        .then((_) {
      _timer?.cancel();
      emit(AudioRecorderRecording(duration: 0));
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        emit((state as AudioRecorderRecording).copyWith(
            duration: (state as AudioRecorderRecording).duration! + 1));
        if (maxDuration != null && state.duration! >= maxDuration!) {
          _timer?.cancel();
          stopRecorder();
        }
      });
    });
  }

  Future<void> stopRecorder() async {
    await _recorder.stopRecorder().then((_) async {
      _timer?.cancel();
      _preparePlayer().then((value) => null);
    });
    if (type != AudioRecorderType.test) {
      File? file = await saveFilePermanently(File(_path ?? ''),
          "${type.toString().split('.').last}_${DateTime.now().millisecondsSinceEpoch}");
      switch (type) {
        case AudioRecorderType.test:
          break;
        case AudioRecorderType.ambientNoise:
          dataCollectionCubitContext
              ?.read<DataCollectionCubit>()
              .setAmbientNoisePath(RecordedAudioEntity(
                  duration: state.duration!, path: file?.path ?? ''));
          break;
        case AudioRecorderType.sustentainedVowel:
          dataCollectionCubitContext
              ?.read<DataCollectionCubit>()
              .setSustentainedVowelPath(RecordedAudioEntity(
                  duration: state.duration!, path: file?.path ?? ''));
          break;
        case AudioRecorderType.phrase:
          dataCollectionCubitContext?.read<DataCollectionCubit>().setPhrasePath(
              RecordedAudioEntity(
                  duration: state.duration!, path: file?.path ?? ''));
          break;
        case AudioRecorderType.rhyme:
          dataCollectionCubitContext?.read<DataCollectionCubit>().setRhymePath(
              RecordedAudioEntity(
                  duration: state.duration!, path: file?.path ?? ''));
          break;
      }
    }
    emit(AudioRecorderStopped(duration: state.duration));
  }

  Future<File?> saveFilePermanently(File tempFile, String newName) async {
    var status = await Permission.manageExternalStorage.request();
    var statusOld = await Permission.storage.request();
    if (!(status == PermissionStatus.granted ||
        statusOld == PermissionStatus.granted)) {
      throw RecordingPermissionException('Storage permission not granted');
    } else {
      try {
        final directory = await getExternalStorageDirectory();
        final String newPath = '${directory!.path}/records/$newName.wav';
        await Directory('${directory.path}/records').create(recursive: true);
        return await tempFile.copy(newPath);
      } catch (e) {
        log('Error saving file permanently');
      }
    }
    return null;
  }

  Future<void> play() async {
    emit(AudioPlayerPlaying(duration: state.duration));
    await controller.startPlayer(finishMode: FinishMode.pause);
    controller.onCompletion.listen((event) {
      emit(AudioPlayerStopped(duration: state.duration));
    });
  }

  Future<void> stopPlayer() async {
    await controller.stopPlayer();
    emit(AudioPlayerStopped(duration: state.duration));
  }

  Future<void> discard() async {
    if (state is AudioPlayerPlaying) {
      await controller.stopPlayer();
    }
    emit(AudioRecorderReady());
    switch (type) {
      case AudioRecorderType.test:
        break;
      case AudioRecorderType.ambientNoise:
        dataCollectionCubitContext
            ?.read<DataCollectionCubit>()
            .setAmbientNoisePath(null);
        break;
      case AudioRecorderType.sustentainedVowel:
        dataCollectionCubitContext
            ?.read<DataCollectionCubit>()
            .setSustentainedVowelPath(null);
        break;
      case AudioRecorderType.phrase:
        dataCollectionCubitContext
            ?.read<DataCollectionCubit>()
            .setPhrasePath(null);
        break;
      case AudioRecorderType.rhyme:
        dataCollectionCubitContext
            ?.read<DataCollectionCubit>()
            .setRhymePath(null);
        break;
    }
  }
}
