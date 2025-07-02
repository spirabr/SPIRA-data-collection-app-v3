import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/domain/entities/line_of_study_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/line_of_study_page.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';

class MockDataCollectionCubit extends MockCubit<DataCollectionState>
    implements DataCollectionCubit {}

void main() {
  late DataCollectionCubit dataCollectionCubit;

  setUp(() {
    dataCollectionCubit = MockDataCollectionCubit();
  });

  group('LineOfStudyPage Tests', () {
    testWidgets('renders LineOfStudyPage correctly',
        (WidgetTester tester) async {
      when(() => dataCollectionCubit.linesOfStudy).thenAnswer((_) async => []);
      when(() => dataCollectionCubit.state).thenReturn(DataCollectionState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: LineOfStudyPage(),
          ),
        ),
      );

      expect(find.text('Linha de Estudo'), findsOneWidget);
      expect(find.byType(CollectionNavigationBar), findsOneWidget);
    });

    testWidgets('shows CircularProgressIndicator when loading',
        (WidgetTester tester) async {
      when(() => dataCollectionCubit.linesOfStudy)
          .thenAnswer((_) async => Future.delayed(Duration(seconds: 1)));
      when(() => dataCollectionCubit.state).thenReturn(DataCollectionState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: LineOfStudyPage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows dropdown when data is available',
        (WidgetTester tester) async {
      final lineOfStudyList = [
        LineOfStudyEntity(id: 1, name: 'Asma'),
        LineOfStudyEntity(id: 2, name: 'Insuficiência Respiratória'),
        LineOfStudyEntity(id: 3, name: 'Tabagismo'),
        LineOfStudyEntity(id: 4, name: 'Controle'),
      ];
      when(() => dataCollectionCubit.linesOfStudy)
          .thenAnswer((_) async => lineOfStudyList);
      when(() => dataCollectionCubit.state).thenReturn(DataCollectionState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: LineOfStudyPage(),
          ),
        ),
      );

      await tester.pump(); // Rebuild after Future completes

      expect(
          find.byType(CollectionDropdown<LineOfStudyEntity>), findsOneWidget);
    });


    testWidgets('dropdown selection updates cubit state',
        (WidgetTester tester) async {
      final lineOfStudyList = [
        LineOfStudyEntity(id: 1, name: 'Asma'),
        LineOfStudyEntity(id: 2, name: 'Insuficiência Respiratória'),
        LineOfStudyEntity(id: 3, name: 'Tabagismo'),
        LineOfStudyEntity(id: 4, name: 'Controle'),
      ];
      when(() => dataCollectionCubit.linesOfStudy)
          .thenAnswer((_) async => lineOfStudyList);
      when(() => dataCollectionCubit.state).thenReturn(DataCollectionState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: LineOfStudyPage(),
          ),
        ),
      );

      await tester.pump(); // Rebuild after Future completes

      await tester.tap(find.byType(CollectionDropdown<LineOfStudyEntity>));
      await tester.pumpAndSettle();

      await tester.tap(find.text(lineOfStudyList.first.name).last);
      await tester.pump();

      verify(() => dataCollectionCubit.setLineOfStudy(lineOfStudyList.first))
          .called(1);
    });

    testWidgets('calls nextStep on valid form submission',
        (WidgetTester tester) async {
      when(() => dataCollectionCubit.linesOfStudy).thenAnswer((_) async => []);
      when(() => dataCollectionCubit.state).thenReturn(DataCollectionState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: LineOfStudyPage(),
          ),
        ),
      );

      await tester.tap(find.text('Próximo'));
      await tester.pump();

      verify(() => dataCollectionCubit.nextStep()).called(1);
    });

    testWidgets('calls previousStep on back button press',
        (WidgetTester tester) async {
      when(() => dataCollectionCubit.linesOfStudy).thenAnswer((_) async => []);
      when(() => dataCollectionCubit.state).thenReturn(DataCollectionState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: LineOfStudyPage(),
          ),
        ),
      );

      await tester.tap(find.text('Anterior'));
      await tester.pump();

      verify(() => dataCollectionCubit.previousStep()).called(1);
    });
  });
}
