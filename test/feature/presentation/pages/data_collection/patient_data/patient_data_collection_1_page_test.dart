import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/domain/entities/comorbidity_entity.dart';
import 'package:spira/feature/domain/entities/gender_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/patient_data/patient_data_collection_1_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_comorbities_selector.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';

class MockDataCollectionCubit extends MockCubit<DataCollectionState>
    implements DataCollectionCubit {}

void main() {
  late DataCollectionCubit dataCollectionCubit;

  setUp(() {
    dataCollectionCubit = MockDataCollectionCubit();
    when(() => dataCollectionCubit.identifierController)
        .thenReturn(TextEditingController());
    when(() => dataCollectionCubit.ageController)
        .thenReturn(TextEditingController());
    when(() => dataCollectionCubit.weightController)
        .thenReturn(TextEditingController());
    when(() => dataCollectionCubit.heightController)
        .thenReturn(TextEditingController());
    when(() => dataCollectionCubit.additionalComorbidityController)
        .thenReturn(TextEditingController());
    final genders = [
      GenderEntity(id: 1, name: 'Masculino'),
      GenderEntity(id: 2, name: 'Feminino'),
      GenderEntity(id: 3, name: 'Outro'),
    ];
    final comorbidities = [
      ComorbidityEntity(id: 1, name: 'Sem comorbidades'),
      ComorbidityEntity(id: 2, name: 'Obesidade'),
      ComorbidityEntity(id: 3, name: 'Rinite'),
      ComorbidityEntity(id: 4, name: 'Disfunção de prega vocal'),
      ComorbidityEntity(id: 5, name: 'Disfunção gastroesofágica'),
      ComorbidityEntity(id: 6, name: 'Hipertensão arterial'),
      ComorbidityEntity(id: 7, name: 'Distúrbios do sono'),
    ];
    when(() => dataCollectionCubit.genders).thenAnswer((_) async => genders);
    when(() => dataCollectionCubit.comorbidities)
        .thenAnswer((_) async => comorbidities);
    when(() => dataCollectionCubit.state).thenReturn(DataCollectionState());
  });

  group('PatientDataCollection1Page Tests', () {
    testWidgets('renders PatientDataCollection1Page correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: PatientDataCollection1Page(),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Dados do Paciente'), findsOneWidget);
      expect(find.byType(CollectionTextFormField), findsAny);
      expect(find.byType(CollectionDropdown<GenderEntity>), findsOneWidget);
      expect(find.byType(CollectionComorbiditiesSelector), findsOneWidget);
    });

    testWidgets('accepts user input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: PatientDataCollection1Page(),
          ),
        ),
      );

      await tester.enterText(
          find.byType(CollectionTextFormField).at(0), '12345');
      await tester.enterText(find.byType(CollectionTextFormField).at(1), '30');
      await tester.enterText(find.byType(CollectionTextFormField).at(2), '70');
      await tester.enterText(find.byType(CollectionTextFormField).at(3), '180');

      expect(find.text('12345'), findsOneWidget);
      expect(find.text('30'), findsOneWidget);
      expect(find.text('70'), findsOneWidget);
      expect(find.text('180'), findsOneWidget);
    });

    testWidgets('calls previousStep on back button press',
        (WidgetTester tester) async {
      when(() => dataCollectionCubit.previousStep()).thenReturn(null);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: PatientDataCollection1Page(),
          ),
        ),
      );

      await tester.tap(find.text('Anterior'));
      await tester.pump();

      verify(() => dataCollectionCubit.previousStep()).called(1);
    });
  });
}
