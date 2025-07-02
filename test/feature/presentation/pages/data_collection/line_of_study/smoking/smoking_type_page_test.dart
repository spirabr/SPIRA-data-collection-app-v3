import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/domain/entities/smoking_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/smoking/smoking_type_page.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';

class MockDataCollectionCubit extends MockCubit<DataCollectionState>
    implements DataCollectionCubit {}

void main() {
  group('SmokingTypePage Tests', () {
    late DataCollectionCubit dataCollectionCubit;
    late List<SmokingEntity> smokingTypes;

    setUp(() {
      dataCollectionCubit = MockDataCollectionCubit();
      smokingTypes = [
        SmokingEntity(id: 1, name: 'Cigarro Comum'),
        SmokingEntity(id: 2, name: 'Cigarro Eletrônico'),
      ];

      when(() => dataCollectionCubit.smokingTypes)
          .thenAnswer((_) async => smokingTypes);
      when(() => dataCollectionCubit.state)
          .thenReturn(DataCollectionState(smokingType: smokingTypes[0]));
    });

    testWidgets('renders SmokingTypePage correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: SmokingTypePage(),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Tipo de cigarro'), findsOneWidget);
      expect(find.byType(CollectionDropdown<SmokingEntity>), findsOneWidget);
      expect(find.byType(CollectionNavigationBar), findsOneWidget);
    });

    testWidgets('calls nextStep on next button press',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: SmokingTypePage(),
          ),
        ),
      );

      await tester.pump(); // Wait for the FutureBuilder to complete

      await tester.tap(find.textContaining('Próximo'));
      await tester.pump();

      verify(() => dataCollectionCubit.nextStep()).called(1);
    });

    testWidgets('calls previousStep on back button press',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: SmokingTypePage(),
          ),
        ),
      );

      await tester.pump(); // Wait for the FutureBuilder to complete

      await tester.tap(find.textContaining('Anterior'));
      await tester.pump();

      verify(() => dataCollectionCubit.previousStep()).called(1);
    });
  });
}
