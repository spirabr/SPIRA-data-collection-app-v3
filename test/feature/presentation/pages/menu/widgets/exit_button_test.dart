import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';
import 'package:spira/feature/presentation/widgets/confirmation_dialog.dart';
import 'package:spira/feature/presentation/pages/menu/widgets/exit_button.dart';

void main() {
  group('ExitButton Tests', () {
    late AuthCubit authCubit;

    setUp(() {
      authCubit = AuthCubit();
    });

    testWidgets('renders ExitButton correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<AuthCubit>(
              create: (_) => authCubit,
              child: ExitButton(),
            ),
          ),
        ),
      );

      expect(find.byType(ExitButton), findsOneWidget);
      expect(find.text('Sair'), findsOneWidget);
      expect(find.byIcon(Icons.exit_to_app), findsOneWidget);
    });

    testWidgets('shows ConfirmationDialog when ExitButton is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<AuthCubit>(
              create: (_) => authCubit,
              child: ExitButton(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ExitButton));
      await tester.pumpAndSettle();

      expect(find.byType(ConfirmationDialog), findsOneWidget);
      expect(find.text('Sair').first,
          findsOneWidget); // Use .first to find the first occurrence
      expect(
          find.text(
              'Tem certeza de que deseja sair?\nVocê será desconectado da sua conta.'),
          findsOneWidget);
      expect(find.text('SAIR'), findsOneWidget);
      expect(find.text('RETORNAR'), findsOneWidget);
    });
    testWidgets('shows ConfirmationDialog when ExitButton is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<AuthCubit>(
              create: (_) => authCubit,
              child: ExitButton(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ExitButton));
      await tester.pumpAndSettle();

      expect(find.byType(ConfirmationDialog), findsOneWidget);
      expect(find.text('Sair').first,
          findsOneWidget); // Use .first to find the first occurrence
      expect(
          find.text(
              'Tem certeza de que deseja sair?\nVocê será desconectado da sua conta.'),
          findsOneWidget);
      expect(find.text('SAIR'), findsOneWidget);
      expect(find.text('RETORNAR'), findsOneWidget);
    });

    testWidgets('dismisses dialog on cancel', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<AuthCubit>(
              create: (_) => authCubit,
              child: ExitButton(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ExitButton));
      await tester.pumpAndSettle();

      await tester.tap(find.text('RETORNAR'));
      await tester.pumpAndSettle();

      expect(find.byType(ConfirmationDialog), findsNothing);
    });
  });
}
