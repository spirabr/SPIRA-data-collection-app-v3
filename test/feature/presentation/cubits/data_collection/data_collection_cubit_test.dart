import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/data/datasources/local/local_data_source.dart';
import 'package:spira/feature/data/model/request/patient_model.dart';
import 'package:spira/feature/data/services/connectivity_service.dart';
import 'package:spira/feature/domain/entities/line_of_study_entity.dart';
import 'package:spira/feature/domain/entities/smoking_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';

import 'package:spira/feature/domain/entities/recorder_audio_entity.dart';
import 'package:spira/feature/data/model/response/audio_response_model.dart';

class MockLocalDataSource extends Mock implements LocalDataSource {}

class MockConnectivityService extends Mock implements ConnectivityService {}

class FakePatientModel extends Fake implements PatientModel {}

void main() {
  late DataCollectionCubit cubit;
  late MockLocalDataSource mockLocalDataSource;
  late MockConnectivityService mockConnectivityService;

  setUpAll(() {
    registerFallbackValue(FakePatientModel());

    registerFallbackValue(RecordedAudioEntity(duration: 0, path: 'dummy_path'));

    registerFallbackValue(DataCollectionStep.patientDataStepOne);
    registerFallbackValue(false);
  });

  setUp(() async {
    await GetIt.I.reset();

    mockLocalDataSource = MockLocalDataSource();
    mockConnectivityService = MockConnectivityService();

    GetIt.I.registerSingleton<LocalDataSource>(mockLocalDataSource);
    GetIt.I.registerSingleton<ConnectivityService>(mockConnectivityService);

    when(() => mockLocalDataSource.getGenders()).thenAnswer((_) async => []);
    when(() => mockLocalDataSource.getFirstLoginResponse())
        .thenAnswer((_) async => null);
    when(() => mockConnectivityService.isConnected())
        .thenAnswer((_) async => false);

    when(() => mockLocalDataSource.insertPatient(any(), any(), any(), any(),
        any(), any(), any(), any(), any(), any())).thenAnswer((_) async => 1);

    cubit = DataCollectionCubit();
  });

  tearDown(() {
    cubit.close();
  });

  group('Testes do novo campo de Monóxido de carbono', () {
    test('Deve salvar Monóxido de Carbono (Double) para cigarro eletrônico',
        () async {
      cubit.setLineOfStudy(LineOfStudyEntity(id: 3, name: 'Tabagismo'));
      cubit.setSmokingType(SmokingEntity(id: 2, name: 'Eletrônico'));

      cubit.identifierController.text = "TESTE-TDD";

      //aqui começa o teste de verdade
      //inserção
      cubit.electronicCarbonMonoxideController.text = "25.5";

      final dummyAudio = RecordedAudioEntity(duration: 0, path: 'dummy_path');

      cubit.setAmbientNoisePath(dummyAudio);
      cubit.setSustentainedVowelPath(dummyAudio);
      cubit.setRhymePath(dummyAudio);

      //ação
      await cubit.submitCollectionData();

      //verificação
      final capturedCall = verify(() => mockLocalDataSource.insertPatient(
          captureAny(),
          any(),
          any(),
          any(),
          any(),
          any(),
          any(),
          any(),
          any(),
          any()));

      final savedPatient = capturedCall.captured.first as PatientModel;

      expect(savedPatient.smokingData?.carbonMonoxide, 25.5);
    });
  });
}
