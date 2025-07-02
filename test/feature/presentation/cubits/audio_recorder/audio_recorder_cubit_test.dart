import 'package:flutter/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:spira/feature/presentation/cubits/audio_recorder/audio_recorder_cubit.dart';

import 'audio_recorder_cubit_test.mocks.dart';

void main() {

  const MethodChannel channel =
      MethodChannel('flutter.baseflow.com/permissions/methods');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'requestPermissions') {
        return {Permission.microphone.value: PermissionStatus.granted.index};
      }
      return null;
    });
  });

  tearDownAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  late MockFlutterSoundRecorder mockRecorder;
  late MockPlayerController mockController;
  late MockPermission mockPermissionHandler;
  late AudioRecorderCubit audioRecorderCubit;

  setUp(() {
    mockRecorder = MockFlutterSoundRecorder();
    mockController = MockPlayerController();
    mockPermissionHandler = MockPermission();
    audioRecorderCubit = AudioRecorderCubit();
  });

  tearDown(() {
    audioRecorderCubit.close();
  });

  group('AudioRecorderCubit', () {
    test('initial state is AudioRecorderInitial', () {
      expect(audioRecorderCubit.state, isA<AudioRecorderInitial>());
    });

    blocTest<AudioRecorderCubit, AudioRecorderState>(
      'emits [AudioRecorderReady] when init is called',
      build: () => audioRecorderCubit,
      act: (cubit) async {
        when(mockPermissionHandler.request())
            .thenAnswer((_) async => PermissionStatus.granted);
        when(mockRecorder.openRecorder()).thenAnswer(
            (_) async => Future<FlutterSoundRecorder?>.value(mockRecorder));
        await cubit.init();
      },
      expect: () => [isA<AudioRecorderReady>()],
    );

    blocTest<AudioRecorderCubit, AudioRecorderState>(
      'emits [AudioRecorderRecording] when record is called',
      build: () => audioRecorderCubit,
      act: (cubit) async {
        when(mockRecorder.startRecorder(
          toFile: anyNamed('toFile'),
        )).thenAnswer((_) async => '');
        cubit.record();
      },
      expect: () => [
        isA<AudioRecorderRecording>(),
      ],
    );

    blocTest<AudioRecorderCubit, AudioRecorderState>(
      'emits [AudioRecorderStopped] when stopRecorder is called',
      build: () => audioRecorderCubit,
      act: (cubit) async {
        when(mockRecorder.stopRecorder()).thenAnswer((_) async => '');
        cubit.record();
        await Future.delayed(Duration(seconds: 1));
        cubit.stopRecorder();
      },
      expect: () => [
        isA<AudioRecorderRecording>(),
        isA<AudioRecorderStopped>(),
      ],
    );

    blocTest<AudioRecorderCubit, AudioRecorderState>(
      'emits [AudioPlayerPlaying] and [AudioPlayerStopped] when play is called',
      build: () => audioRecorderCubit,
      act: (cubit) async {
        when(mockController.startPlayer(finishMode: FinishMode.pause))
            .thenAnswer((_) async => '');
        cubit.record();
        await Future.delayed(Duration(seconds: 1));
        cubit.stopRecorder();
        await cubit.play();
      },
      expect: () => [
        isA<AudioPlayerPlaying>(),
        isA<AudioPlayerStopped>(),
      ],
    );

    blocTest<AudioRecorderCubit, AudioRecorderState>(
      'emits [AudioPlayerStopped] when stopPlayer is called',
      build: () => audioRecorderCubit,
      act: (cubit) async {
        when(mockController.stopPlayer()).thenAnswer((_) async => '');
        await cubit.stopPlayer();
      },
      expect: () => [
        isA<AudioPlayerStopped>(),
      ],
    );

    blocTest<AudioRecorderCubit, AudioRecorderState>(
      'emits [AudioRecorderReady] when discard is called',
      build: () => audioRecorderCubit,
      act: (cubit) async {
        cubit.discard();
      },
      expect: () => [
        isA<AudioRecorderReady>(),
      ],
    );

    blocTest<AudioRecorderCubit, AudioRecorderState>(
      'emits [AudioDeniedPermission] when microphone permission is denied',
      build: () => audioRecorderCubit,
      act: (cubit) async {
        when(mockPermissionHandler.request())
            .thenAnswer((_) async => PermissionStatus.denied);
        try {
          await cubit.openTheRecorder();
        } catch (_) {}
      },
      expect: () => [
        isA<AudioDeniedPermission>(),
      ],
    );
  });
}
