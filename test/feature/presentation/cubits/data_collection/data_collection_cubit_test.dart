import 'package:bloc_test/bloc_test.dart';
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
import 'package:spira/feature/domain/entities/comorbidity_entity.dart';
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

  group('Teste de novas comorbidades', () {
    test('Deve conter as novas comorbidades na lista', () async {
      when(() => mockLocalDataSource.getComorbidities())
          .thenAnswer((_) async => []);

      final listaFinal = await cubit.comorbidities;

      expect(listaFinal.any((c) => c.name == 'doença coronariana'), isTrue);
      expect(listaFinal.any((c) => c.name == 'infarto agudo do miocárdio'),
          isTrue);
      expect(listaFinal.any((c) => c.name == 'dislipidemia'), isTrue);
      expect(listaFinal.any((c) => c.name == 'diabetes insulino dependente'),
          isTrue);
      expect(
          listaFinal.any((c) => c.name == 'diabetes não-insulino dependente'),
          isTrue);
      expect(listaFinal.any((c) => c.name == 'convulsão'), isTrue);
      expect(listaFinal.any((c) => c.name == 'AVC'), isTrue);
      expect(listaFinal.any((c) => c.name == 'doença Tireoide'), isTrue);
      expect(listaFinal.any((c) => c.name == 'insuficiência cardíaca'), isTrue);
      expect(listaFinal.any((c) => c.name == 'arritmia'), isTrue);
      expect(listaFinal.any((c) => c.name == 'insuficiência renal'), isTrue);
      expect(listaFinal.any((c) => c.name == 'doença valvar'), isTrue);
      expect(listaFinal.any((c) => c.name == 'neoplasia'), isTrue);
      expect(listaFinal.any((c) => c.name == 'DPOC'), isTrue);
      expect(listaFinal.any((c) => c.name == 'asma Brônquica'), isTrue);
      expect(listaFinal.any((c) => c.name == 'síndrome dispéptica'), isTrue);
      expect(listaFinal.any((c) => c.name == 'doença vascular'), isTrue);
    });

    test(
        'As novas comorbidades devem ser salvas corretamentes na entidade paciente',
        () async {

      when(() => mockLocalDataSource.insertPatient(any(), any(), any(), any(),
          any(), any(), any(), any(), any(), any())).thenAnswer((_) async => 1);

      final dummyAudio = RecordedAudioEntity(duration: 0, path: 'dummy_path');
      cubit.setAmbientNoisePath(dummyAudio);
      cubit.setSustentainedVowelPath(dummyAudio);
      cubit.setRhymePath(dummyAudio);

      cubit.setComorbidities([
        ComorbidityEntity(id: 7, name: 'Doença coronariana'),
        ComorbidityEntity(id: 8, name: 'Infarto agudo do miocárdio'),
      ]);

      await cubit.submitCollectionData();

      final capturedCalls = verify(() => mockLocalDataSource.insertPatient(
          captureAny(),
          any(), any(), any(), any(), any(), any(), any(), any(), any()
      )).captured;

      final pacienteEnviado = capturedCalls.first as PatientModel;

      expect(pacienteEnviado.comorbidityIds, contains(7));
      expect(pacienteEnviado.comorbidityIds, contains(8));
    });
  });
}
