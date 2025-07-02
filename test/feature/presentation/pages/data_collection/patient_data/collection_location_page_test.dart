import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/patient_data/collection_location_page.dart';

class MockDataCollectionCubit extends MockCubit<DataCollectionState>
    implements DataCollectionCubit {
  MockDataCollectionCubit() {
    // Initialize the state with a valid DataCollectionState
    emit(DataCollectionState());
  }
}

void main() {
  group('CollectionLocationPage Tests', () {
    late MockDataCollectionCubit mockDataCollectionCubit;

    setUp(() {
      mockDataCollectionCubit = MockDataCollectionCubit();
    });

    testWidgets('renders CollectionLocationPage correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => mockDataCollectionCubit,
            child: CollectionLocationPage(onPressedPrevious: () {}),
          ),
        ),
      );

      expect(find.byType(CollectionLocationPage), findsOneWidget);
    });

    testWidgets('displays correct title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => mockDataCollectionCubit,
            child: CollectionLocationPage(onPressedPrevious: () {}),
          ),
        ),
      );

      expect(find.text('Local da Coleta'), findsOneWidget);
    });
  });
}
