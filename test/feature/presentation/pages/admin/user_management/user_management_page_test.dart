import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/cubits/user_management/user_management_cubit.dart';
import 'package:spira/feature/presentation/pages/admin/user_management/user_management_page.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/user_management_list.dart';

class MockUserManagementCubit extends MockCubit<UserManagementState>
    implements UserManagementCubit {}

void main() {
  group('UserManagementPage Tests', () {
    late UserManagementCubit mockCubit;

    setUp(() {
      mockCubit = MockUserManagementCubit();
    });
    testWidgets('Displays user list when state is loaded',
        (WidgetTester tester) async {
      when(() => mockCubit.state).thenReturn(
        UserManagementState(
          loadState: GenericLoadState.success,
          currentTab: UserManagementTab.active,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<UserManagementCubit>(
            create: (_) => mockCubit,
            child: UserManagementPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(UserManagementList), findsOneWidget);
    });

    testWidgets('Check tabs', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<UserManagementCubit>(
            create: (_) => mockCubit,
            child: UserManagementPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.pump();

      expect(find.text('Inativos'), findsOneWidget);
      expect(find.text('Ativos'), findsOneWidget);
    });
  });
}
