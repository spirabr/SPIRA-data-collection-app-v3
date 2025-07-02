import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/role_entity.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/presentation/cubits/user_management/user_management_cubit.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/user_management_list.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/user_list_item.dart';

class MockUserManagementCubit extends MockCubit<UserManagementState>
    implements UserManagementCubit {}

void main() {
  late UserManagementCubit mockUserManagementCubit;

  setUp(() {
    mockUserManagementCubit = MockUserManagementCubit();

    List<UserEntity> users = [
      UserEntity(
        id: 1,
        email: "user1@email.com",
        fullName: "User 1",
        active: true,
        roles: [
          RoleEntity(id: 1, authority: "ROLE_ADMIN"),
        ],
      ),
      UserEntity(
        id: 2,
        email: "user2@email.com",
        fullName: "User 2",
        active: true,
        roles: [
          RoleEntity(id: 1, authority: "ROLE_ADMIN"),
        ],
      ),
      UserEntity(
        id: 3,
        email: "user3@email.com",
        fullName: "User 3",
        active: true,
        roles: [
          RoleEntity(id: 2, authority: "ROLE_USER"),
        ],
      ),
      UserEntity(
        id: 4,
        email: "user4@email.com",
        fullName: "User 4",
        active: false,
        roles: [
          RoleEntity(id: 2, authority: "ROLE_USER"),
        ],
      ),
      UserEntity(
        id: 5,
        email: "user5@email.com",
        fullName: "User 5",
        active: false,
        roles: [
          RoleEntity(id: 2, authority: "ROLE_USER"),
        ],
      ),
      UserEntity(
        id: 6,
        email: "user6@email.com",
        fullName: "User 6",
        active: true,
        roles: [
          RoleEntity(id: 2, authority: "ROLE_USER"),
        ],
      ),
    ];
    when(() => mockUserManagementCubit.loadUsers())
        .thenAnswer((_) async => users);
    when(() => mockUserManagementCubit.state).thenReturn(UserManagementState(
      currentTab: UserManagementTab.active,
      loadState: GenericLoadState.success,
      users: users,
    ));
    when(() => mockUserManagementCubit.getActiveUsers())
        .thenAnswer((_) => users.where((user) => user.active).toList());
    when(() => mockUserManagementCubit.getInactiveUsers())
        .thenAnswer((_) => users.where((user) => !user.active).toList());
  });

  group('UserManagementList Tests', () {
    testWidgets('shows loading indicator initially',
        (WidgetTester tester) async {
      when(() => mockUserManagementCubit.state).thenReturn(UserManagementState(
        currentTab: UserManagementTab.active,
        loadState: GenericLoadState.loading,
      ));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<UserManagementCubit>(
            create: (_) => mockUserManagementCubit..loadUsers(),
            child: const UserManagementList(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'shows list of users when state is success and users are present',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<UserManagementCubit>(
            create: (_) => mockUserManagementCubit..loadUsers(),
            child: const UserManagementList(),
          ),
        ),
      );

      expect(find.byType(UserListItem), findsAtLeast(1));
    });

    testWidgets('shows message when no users are found',
        (WidgetTester tester) async {
      when(() => mockUserManagementCubit.getActiveUsers()).thenReturn([]);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<UserManagementCubit>(
            create: (_) => mockUserManagementCubit..loadUsers(),
            child: const UserManagementList(),
          ),
        ),
      );

      expect(find.text('Nenhum usuário encontrado'), findsOneWidget);
    });

    testWidgets('shows error message when state is error',
        (WidgetTester tester) async {
      when(() => mockUserManagementCubit.state).thenReturn(UserManagementState(
        currentTab: UserManagementTab.active,
        loadState: GenericLoadState.error,
      ));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<UserManagementCubit>(
            create: (_) => mockUserManagementCubit..loadUsers(),
            child: const UserManagementList(),
          ),
        ),
      );

      expect(find.text('Nenhum usuário encontrado'), findsOneWidget);
    });
  });
}
