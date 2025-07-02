import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spira/feature/presentation/pages/admin/manage_fields/manage_fields_page.dart';
import 'package:spira/feature/presentation/widgets/menu_button.dart';
import 'package:spira/feature/presentation/widgets/spira_app_bar.dart';

void main() {
  group('ManageFieldsPage Tests', () {
    testWidgets('renders ManageFieldsPage correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ManageFieldsPage(),
        ),
      );

      expect(find.byType(ManageFieldsPage), findsOneWidget);
    });

    testWidgets('contains SpiraAppBar with correct title and subtitle',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ManageFieldsPage(),
        ),
      );

      final appBarFinder = find.byType(SpiraAppBar);
      expect(appBarFinder, findsOneWidget);

      final appBarWidget = tester.widget<SpiraAppBar>(appBarFinder);
      expect(appBarWidget.title, "Gerenciar Campos");
      expect(appBarWidget.subtitle,
          "Selecione a categoria para\nalterar os campos");
    });

    testWidgets('contains MenuButtons with correct text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ManageFieldsPage(),
        ),
      );

      expect(find.widgetWithText(MenuButton, "Geral"), findsOneWidget);
      expect(find.widgetWithText(MenuButton, "Insuficiência Respiratória"),
          findsOneWidget);
      expect(find.widgetWithText(MenuButton, "Tabagismo"), findsOneWidget);
    });
  });
}
