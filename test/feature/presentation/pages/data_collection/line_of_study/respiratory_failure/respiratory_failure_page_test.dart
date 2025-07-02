import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/domain/entities/hospitalization_location_entity.dart';
import 'package:spira/feature/domain/entities/respiratory_failure_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/respiratory_failure/respiratory_failure_page.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_three_text_form_fields.dart';

class MockDataCollectionCubit extends MockCubit<DataCollectionState>
    implements DataCollectionCubit {}

void main() {
  late MockDataCollectionCubit cubit;

  setUp(() {
    cubit = MockDataCollectionCubit();
    when(() => cubit.bloodGasOneController).thenReturn(TextEditingController());
    when(() => cubit.bloodGasTwoController).thenReturn(TextEditingController());
    when(() => cubit.bloodGasThreeController)
        .thenReturn(TextEditingController());
    when(() => cubit.hospitalizationDaysController)
        .thenReturn(TextEditingController());
    when(() => cubit.hemodynamicEvaluationController)
        .thenReturn(TextEditingController());
    when(() => cubit.medicalDiagnosisController)
        .thenReturn(TextEditingController());

    when(() => cubit.hospitalizationLocations).thenAnswer((_) async => [
          HospitalizationLocationEntity(id: 1, name: 'UTI'),
          HospitalizationLocationEntity(id: 2, name: 'Enfermaria'),
        ]);

    when(() => cubit.respiratoryFailures).thenAnswer((_) async => [
          RespiratoryFailureEntity(id: 1, name: 'Pulmonar'),
          RespiratoryFailureEntity(id: 2, name: 'Extrapulmonar'),
        ]);
    when(() => cubit.state).thenReturn(DataCollectionState());
  });

  group('RespiratoryFailurePage Widget Tests', () {
    testWidgets('RespiratoryFailurePage renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => cubit,
            child: RespiratoryFailurePage(),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Dados do Paciente'), findsOneWidget);
      expect(find.text('Insuficiência Respiratória'), findsOneWidget);
      expect(find.byType(CollectionThreeTextFormFields), findsOneWidget);
      expect(find.byType(CollectionTextFormField), findsAny);
    });

    testWidgets('Form validation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => cubit,
            child: RespiratoryFailurePage(),
          ),
        ),
      );

      await tester.tap(find.textContaining("Próximo").first);
      await tester.pumpAndSettle();

      expect(find.text('Campo obrigatório'), findsAny);
    });
  });
}
