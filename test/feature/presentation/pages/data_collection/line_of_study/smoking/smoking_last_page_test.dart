import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spira/feature/domain/entities/health_perception_entity.dart';
import 'package:spira/feature/domain/entities/smoking_cessation_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/smoking/smoking_last_page.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';

void main() {
  group('SmokingLastPage Tests', () {
    late DataCollectionCubit dataCollectionCubit;

    setUp(() {
      dataCollectionCubit = DataCollectionCubit();
    });

    testWidgets('renders SmokingLastPage correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: SmokingLastPage(),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 2));

      expect(find.text("Dados do Paciente"), findsOneWidget);
      expect(find.text("Tabagismo"), findsOneWidget);
      expect(find.byType(CollectionTextFormField), findsOneWidget);
      expect(find.byType(CollectionDropdown<SmokingCessationEntity>),
          findsOneWidget);
      expect(find.byType(CollectionDropdown<HealthPerceptionEntity>),
          findsOneWidget);
    });

    testWidgets('validates form correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: SmokingLastPage(),
          ),
        ),
      );

      await tester.tap(find.text('Próximo'));
      await tester.pumpAndSettle();

      expect(find.text('Campo obrigatório'), findsNothing);

      dataCollectionCubit.antiSmokingWeeksController.text = '5';
      await tester.tap(find.text('Próximo'));
      await tester.pumpAndSettle();

      expect(find.text('Campo obrigatório'), findsNothing);
    });
  });
}
