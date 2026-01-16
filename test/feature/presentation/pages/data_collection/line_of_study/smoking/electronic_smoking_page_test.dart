import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/domain/entities/nicotine_amount_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/smoking/electronic_smoking_page.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_two_text_form_fields.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';

class MockDataCollectionCubit extends MockCubit<DataCollectionState>
    implements DataCollectionCubit {
  MockDataCollectionCubit() {
    // Initialize the state with a valid DataCollectionState
    emit(DataCollectionState());
  }

  // electronic smoking text fields
  TextEditingController electronicTobaccoLoadController =
  TextEditingController();
  TextEditingController electronicConsumptionTimeOneController =
  TextEditingController();
  TextEditingController electronicConsumptionTimeTwoController =
  TextEditingController();
  TextEditingController electronicCessationTimeOneController =
  TextEditingController();
  TextEditingController electronicCessationTimeTwoController =
  TextEditingController();

  Future<List<NicotineAmountEntity>> get nicotineAmounts async {
    return [
      NicotineAmountEntity(id: 1, name: '20mg'),
      NicotineAmountEntity(id: 2, name: '30mg'),
      NicotineAmountEntity(id: 3, name: '50mg'),
    ];
  }
}

void main() {
  group('ElectronicSmokingPage Tests', () {
    late DataCollectionCubit dataCollectionCubit;

    setUp(() {
      dataCollectionCubit = MockDataCollectionCubit();
      when(() => dataCollectionCubit.state).thenReturn(DataCollectionState());
    });

    testWidgets('renders ElectronicSmokingPage correctly',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<DataCollectionCubit>(
                create: (_) => dataCollectionCubit,
                child: ElectronicSmokingPage(),
              ),
            ),
          );

          expect(find.text('Dados do Paciente'), findsOneWidget);
          expect(find.text('Tabagismo - Eletrônico'), findsOneWidget);
          expect(find.byType(CollectionTwoTextFormFields), findsNWidgets(2));
          expect(find.byType(CollectionDropdown<NicotineAmountEntity>),
              findsOneWidget);
          expect(find.byType(CollectionNavigationBar), findsOneWidget);
        });

    testWidgets('accepts user input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DataCollectionCubit>(
            create: (_) => dataCollectionCubit,
            child: ElectronicSmokingPage(),
          ),
        ),
      );

      await tester.enterText(find
          .byType(TextFormField)
          .first, '10');
      await tester.enterText(find
          .byType(TextFormField)
          .last, '20');

      expect(find.text('10'), findsOneWidget);
      expect(find.text('20'), findsOneWidget);
    });

    testWidgets('validates form and calls nextStep on valid input',
            (WidgetTester tester) async {
          when(() => dataCollectionCubit.nextStep()).thenReturn(null);

          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<DataCollectionCubit>(
                create: (_) => dataCollectionCubit,
                child: ElectronicSmokingPage(),
              ),
            ),
          );

          await tester.enterText(find
              .byType(TextFormField)
              .first, '10');
          await tester.enterText(find
              .byType(TextFormField)
              .last, '20');
          await tester.tap(find.text('Next'));
          await tester.pump();

          verify(() => dataCollectionCubit.nextStep()).called(1);
        });

    testWidgets('calls previousStep on back button press',
            (WidgetTester tester) async {
          when(() => dataCollectionCubit.previousStep()).thenReturn(null);

          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<DataCollectionCubit>(
                create: (_) => dataCollectionCubit,
                child: ElectronicSmokingPage(),
              ),
            ),
          );

          await tester.tap(find.text('Back'));
          await tester.pump();

          verify(() => dataCollectionCubit.previousStep()).called(1);
        });

    testWidgets('The first input should only accept 6 numeric digits',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
                home: BlocProvider<DataCollectionCubit>(
                  create: (_) => dataCollectionCubit,
                  child: ElectronicSmokingPage(),
                )
            ),
          );

          final campoBaforada = find
              .byType(TextFormField)
              .first;

          await tester.enterText(campoBaforada, '1234567');
          await tester.pump();

          expect(find.text('1234567'), findsNothing);
          expect(find.text('123'), findsNothing);
          expect(find.text('123456'), findsOneWidget);
        });

    testWidgets('Input de adicionar Monóxido de Carbono deve existir',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<DataCollectionCubit>(
                create: (_) => dataCollectionCubit,
                child: ElectronicSmokingPage(),
              ),
            ),
          );

          expect(find.byType(CollectionTextFormField), findsNWidgets(2));
        });

    testWidgets('Input de COex deve aceitar apenas números e virgula',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<DataCollectionCubit>(
                create: (_) => dataCollectionCubit,
                child: ElectronicSmokingPage(),
              ),
            ),
          );

          final campoMonoxido = find.byType(TextFormField).last;

          await tester.enterText(campoMonoxido, '12eA3,l456');
          await tester.pump();

          expect(find.text('12eA3,l456'), findsNothing);
          expect(find.text('123456'), findsNothing);
          expect(find.text('123,456'), findsNothing);
          expect(find.text('123,45'), findsOneWidget);
        });
  });
}
