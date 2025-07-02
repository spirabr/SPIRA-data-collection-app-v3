import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/submit_data_page.dart';
import 'package:spira/feature/presentation/widgets/colored_button.dart';
import 'package:mocktail/mocktail.dart';

class MockDataCollectionCubit extends Mock implements DataCollectionCubit {}

void main() {
  group('SubmitDataPage Tests', () {
    late DataCollectionCubit dataCollectionCubit;

    setUp(() {
      dataCollectionCubit = MockDataCollectionCubit();
    });

    testWidgets('renders SubmitDataPage correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<DataCollectionCubit>(
              create: (_) => dataCollectionCubit,
              child: const SubmitDataPage(),
            ),
          ),
        ),
      );

      expect(find.byType(SubmitDataPage), findsOneWidget);
      expect(find.text('Finalizar Coleta'), findsOneWidget);
      expect(
          find.text(
              'Deseja finalizar a coleta?\nApós clicar em finalizar,\nvocê não poderá retornar ao formulário.',
              findRichText: true),
          findsOneWidget);
      expect(find.byType(ColoredButton), findsNWidgets(2));
    });
  });
}
