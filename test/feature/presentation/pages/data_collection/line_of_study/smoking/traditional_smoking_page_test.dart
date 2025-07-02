import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/smoking/traditional_smoking_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_two_text_form_fields.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/smoking_option_widget.dart';

class MockDataCollectionCubit extends MockCubit<DataCollectionState>
    implements DataCollectionCubit {}

void main() {
  group('TraditionalSmokingPage Tests', () {
    late DataCollectionCubit dataCollectionCubit;

    setUp(() {
      dataCollectionCubit = MockDataCollectionCubit();
      when(() => dataCollectionCubit.traditionalCarbonMonoxideController)
          .thenReturn(TextEditingController());
      when(() => dataCollectionCubit.traditionalTobaccoLoadController)
          .thenReturn(TextEditingController());
      when(() => dataCollectionCubit.traditionalConsumptionTimeOneController)
          .thenReturn(TextEditingController());
      when(() => dataCollectionCubit.traditionalConsumptionTimeTwoController)
          .thenReturn(TextEditingController());
      when(() => dataCollectionCubit.traditionalCessationTimeOneController)
          .thenReturn(TextEditingController());
      when(() => dataCollectionCubit.traditionalCessationTimeTwoController)
          .thenReturn(TextEditingController());
    });

    testWidgets('renders TraditionalSmokingPage correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: TraditionalSmokingPage(),
          ),
        ),
      );

      expect(find.text('Dados do Paciente'), findsOneWidget);
      expect(find.byType(CollectionTextFormField), findsOneWidget);
      expect(find.byType(CollectionTwoTextFormFields), findsNWidgets(2));
      expect(find.byType(CollectionNavigationBar), findsOneWidget);
    });

    testWidgets('calls previousStep on back button press',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: TraditionalSmokingPage(),
          ),
        ),
      );

      await tester.tap(find.text('Anterior'));
      await tester.pump();

      verify(() => dataCollectionCubit.previousStep()).called(1);
    });

    testWidgets('renders conditional widgets based on smokingFrom option',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child:
                TraditionalSmokingPage(smokingFrom: SmokingFromOption.asthma),
          ),
        ),
      );

      expect(find.byType(SmokingOptionWidget), findsOneWidget);
      expect(find.text('Tempo de cessação'), findsOneWidget);
    });
  });
}
