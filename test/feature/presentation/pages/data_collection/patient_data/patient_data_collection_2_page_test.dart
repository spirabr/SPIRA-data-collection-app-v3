import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/domain/entities/smoker_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/patient_data/patient_data_collection_2_page.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_two_text_form_fields.dart';

class MockDataCollectionCubit extends MockCubit<DataCollectionState>
    implements DataCollectionCubit {}

void main() {
  group('PatientDataCollection2Page Tests', () {
    late MockDataCollectionCubit mockDataCollectionCubit;

    setUp(() {
      mockDataCollectionCubit = MockDataCollectionCubit();
      when(() => mockDataCollectionCubit.heartRateController)
          .thenReturn(TextEditingController());
      when(() => mockDataCollectionCubit.respiratoryRateController)
          .thenReturn(TextEditingController());
      when(() => mockDataCollectionCubit.saturationController)
          .thenReturn(TextEditingController());
      when(() => mockDataCollectionCubit.bloodPressureOneController)
          .thenReturn(TextEditingController());
      when(() => mockDataCollectionCubit.bloodPressureTwoController)
          .thenReturn(TextEditingController());
      final smokers = [
        SmokerEntity(id: 1, name: 'Fumante'),
        SmokerEntity(id: 2, name: 'Não fumante'),
        SmokerEntity(id: 3, name: 'Ex-fumante'),
      ];
      when(() => mockDataCollectionCubit.smokers)
          .thenAnswer((_) async => smokers);

      when(() => mockDataCollectionCubit.state)
          .thenReturn(DataCollectionState());
    });

    testWidgets('renders PatientDataCollection2Page correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => mockDataCollectionCubit,
            child: PatientDataCollection2Page(),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Dados do Paciente'), findsOneWidget);
      expect(find.byType(CollectionTextFormField), findsNWidgets(3));
      expect(find.byType(CollectionTwoTextFormFields), findsOneWidget);
      expect(find.byType(CollectionDropdown<SmokerEntity>), findsOneWidget);
    });

    testWidgets('validates form fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => mockDataCollectionCubit,
            child: PatientDataCollection2Page(),
          ),
        ),
      );

      await tester.tap(find.textContaining("Próximo").first);
      await tester.pumpAndSettle();

      expect(find.text('Campo obrigatório'), findsAny);
    });

    testWidgets('shows CircularProgressIndicator while loading smokers',
        (WidgetTester tester) async {
      when(() => mockDataCollectionCubit.smokers)
          .thenAnswer((_) async => Future.delayed(Duration(seconds: 1)));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => mockDataCollectionCubit,
            child: PatientDataCollection2Page(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
