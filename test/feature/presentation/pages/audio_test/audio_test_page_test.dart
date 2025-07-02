import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/presentation/cubits/audio_recorder/audio_recorder_cubit.dart';
import 'package:spira/feature/presentation/pages/audio_test/audio_test_page.dart';
import 'package:spira/feature/presentation/widgets/recorder/recorder_section.dart';

class MockAudioRecorderCubit extends Mock implements AudioRecorderCubit {}

void main() {
  group('AudioTestPage Tests', () {
    late AudioRecorderCubit audioRecorderCubit;

    setUp(() {
      audioRecorderCubit = MockAudioRecorderCubit();
    });

    testWidgets('renders AudioTestPage correctly', (WidgetTester tester) async {
      when(() => audioRecorderCubit.state).thenReturn(AudioRecorderInitial());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AudioRecorderCubit>(
            create: (_) => audioRecorderCubit,
            child: const AudioTestPage(),
          ),
        ),
      );

      expect(find.text('Teste de Áudio'), findsOneWidget);
      expect(find.text('Grave o áudio e ouça para garantir que não há falhas no dispositivo.'), findsOneWidget);
      expect(find.byType(RecorderSection), findsOneWidget);
    });

    testWidgets('navigates back on back button press', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AudioRecorderCubit>(
            create: (_) => audioRecorderCubit,
            child: const AudioTestPage(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back_ios));
      await tester.pumpAndSettle();

      expect(find.byType(AudioTestPage), findsNothing);
    });
  });
}