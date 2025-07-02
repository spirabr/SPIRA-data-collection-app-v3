import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/on_generate_route.dart';
import 'package:spira/feature/presentation/pages/login/login_page.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';
import 'package:spira/feature/presentation/pages/login/widgets/login_input_widget.dart';
import 'package:spira/feature/presentation/pages/menu/menu_page.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  group('LoginPage Tests', () {
    late AuthCubit authCubit;

    setUp(() {
      authCubit = AuthCubit();
    });

    testWidgets('renders LoginPage correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>(
            create: (_) => authCubit,
            child: LoginPage(),
          ),
        ),
      );

      expect(find.text('Bem vindo ao SPIRA!\n'), findsOneWidget);
      expect(
          find.text('Insira o seu usuário e senha para acessar o aplicativo.'),
          findsOneWidget);
      expect(find.byType(UserTextField), findsOneWidget);
      expect(find.byType(PasswordTextField), findsOneWidget);
      expect(find.text('Entrar'), findsOneWidget);
    });

    testWidgets('accepts user input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>(
            create: (_) => authCubit,
            child: LoginPage(),
          ),
        ),
      );

      await tester.enterText(find.byType(UserTextField), 'testuser');
      await tester.enterText(find.byType(PasswordTextField), 'password123');

      expect(find.text('testuser'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);
    });

    testWidgets('calls login on button press', (WidgetTester tester) async {
      final cubit = MockAuthCubit();
      when(() => cubit.state).thenReturn(AuthState());
      when(() => cubit.login(any(), any())).thenAnswer((_) async {});

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>(
            create: (_) => cubit,
            child: LoginPage(),
          ),
          builder: EasyLoading.init(),
          onGenerateRoute: OnGenerateRoute.onGenerateRoute,
        ),
      );

      // Simulate user input and button press
      await tester.enterText(find.byType(UserTextField), 'admin@spira.com');
      await tester.enterText(find.byType(PasswordTextField), '123');
      await tester.ensureVisible(find.textContaining('Entrar'));
      await tester.tap(find.textContaining('Entrar'));
      await tester.pump();

      // Verify that the login method was called
      verify(() => cubit.login('admin@spira.com', '123')).called(1);
    });

    testWidgets('navigates to menuPage on successful login',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthCubit>(
            create: (_) => authCubit,
            child: LoginPage(),
          ),
          onGenerateRoute: OnGenerateRoute.onGenerateRoute,
        ),
      );

      authCubit.emit(AuthState(loadState: GenericLoadState.success));
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      expect(find.byType(MenuPage), findsOneWidget);
    });
  });
}
