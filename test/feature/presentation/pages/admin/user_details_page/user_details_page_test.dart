import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spira/feature/domain/entities/role_entity.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/presentation/pages/admin/user_details/user_details_page.dart';
import 'package:spira/feature/core/enums.dart';

void main() {
  group('UserDetailsPage Tests', () {
    late UserDetailsPageArgs argsWithUser;
    late UserDetailsPageArgs argsWithUserEdit;
    late UserDetailsPageArgs argsWithoutUser;

    setUp(() {
      argsWithUser = UserDetailsPageArgs(
        user: UserEntity(
          id: 1,
          fullName: 'Test User',
          email: 'test@example.com',
          active: true,
          roles: [
            RoleEntity(id: 1, authority: "ROLE_ADMIN"),
          ],
        ),
        userDetailsFrom: UserDetailsFrom.userManagement,
      );
      argsWithoutUser = UserDetailsPageArgs(
        userDetailsFrom: UserDetailsFrom.register,
      );
    });
    argsWithUserEdit = UserDetailsPageArgs(
      user: UserEntity(
        id: 1,
        fullName: 'Test User',
        email: 'test@example.com',
        active: true,
        roles: [
          RoleEntity(id: 1, authority: "ROLE_ADMIN"),
        ],
      ),
      userDetailsFrom: UserDetailsFrom.editUser,
    );

    testWidgets('renders UserDetailsPage correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UserDetailsPage(args: argsWithUser),
        ),
      );

      expect(find.byType(UserDetailsPage), findsOneWidget);
    });

    testWidgets('populates form fields when user is provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UserDetailsPage(args: argsWithUserEdit),
        ),
      );

      expect(find.text('Test User'), findsOneWidget);
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('form fields are empty when no user is provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UserDetailsPage(args: argsWithoutUser),
        ),
      );

      expect(find.textContaining('Nome'), findsOneWidget);
      expect(find.textContaining('E-mail'), findsOneWidget);
      expect(find.textContaining('Senha'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Confirmar Senha'), findsOneWidget);
    });

    testWidgets('edit button is visible', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UserDetailsPage(args: argsWithUser),
        ),
      );

      expect(find.byIcon(FontAwesomeIcons.pencil), findsOneWidget);
    });

    testWidgets('cancel button pops navigation stack',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UserDetailsPage(args: argsWithoutUser),
        ),
      );

      await tester.tap(find.text('Cancelar'));
      await tester.pumpAndSettle();

      expect(find.byType(UserDetailsPage), findsNothing);
    });
  });
}
