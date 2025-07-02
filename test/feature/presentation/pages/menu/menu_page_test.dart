import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spira/feature/presentation/pages/menu/menu_page.dart';
import 'package:spira/feature/presentation/pages/menu/widgets/exit_button.dart';

void main() {
  group('MenuPage Tests', () {
    testWidgets('renders MenuPage correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MenuPage(),
        ),
      );

      expect(find.byType(MenuPage), findsOneWidget);
    });

    testWidgets('contains ExitButton', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MenuPage(),
        ),
      );

      expect(find.byType(ExitButton), findsOneWidget);
    });

    testWidgets('contains Assets.spira.image', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MenuPage(),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('PopScope is configured correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MenuPage(),
        ),
      );

      final popScopeFinder = find.byType(PopScope);
      expect(popScopeFinder, findsOneWidget);

      final popScopeWidget = tester.widget<PopScope>(popScopeFinder);
      expect(popScopeWidget.canPop, isFalse);
    });
  });
}
