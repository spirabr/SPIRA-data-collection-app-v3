import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/presentation/pages/admin/manage_fields/manage_fields_page.dart';
import 'package:spira/feature/presentation/pages/admin/manage_general_fields/manage_general_fields_page.dart';
import 'package:spira/feature/presentation/pages/admin/manage_respiratory_failure_fields/manage_respiratory_failure_fields_page.dart';
import 'package:spira/feature/presentation/pages/admin/manage_smoking_fields/manage_smoking_fields_page.dart';
import 'package:spira/feature/presentation/pages/admin/user_details/user_details_page.dart';
import 'package:spira/feature/presentation/pages/audio_test/audio_test_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/data_collection_page.dart';
import 'package:spira/feature/presentation/pages/login/login_page.dart';
import 'package:spira/feature/presentation/pages/menu/menu_page.dart';
import 'package:spira/feature/presentation/pages/admin/user_management/user_management_page.dart';

class OnGenerateRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.loginPage:
        return materialBuilder(widget: LoginPage());
      case PageConst.menuPage:
        return materialBuilder(widget: const MenuPage());
      case PageConst.audioTestPage:
        return materialBuilder(widget: const AudioTestPage());
      case PageConst.dataCollectionPage:
        return materialBuilder(widget: const DataCollectionPage());
      case PageConst.registerUser:
        return materialBuilder(
            widget: UserDetailsPage(
                args: UserDetailsPageArgs(
          userDetailsFrom: UserDetailsFrom.register,
        )));
      case PageConst.userManagement:
        return materialBuilder(widget: UserManagementPage());
      case PageConst.userDetails:
        return materialBuilder(
            widget: UserDetailsPage(
                args: UserDetailsPageArgs(
                    userDetailsFrom: UserDetailsFrom.userManagement,
                    user: args as UserEntity)));
      case PageConst.profileDetails:
        return materialBuilder(
            widget: UserDetailsPage(
                args: UserDetailsPageArgs(
                    userDetailsFrom: UserDetailsFrom.profile,
                    user: args as UserEntity)));
      case PageConst.editUser:
        return materialBuilder(
            widget: UserDetailsPage(
                args: UserDetailsPageArgs(
                    userDetailsFrom: UserDetailsFrom.editUser,
                    user: args as UserEntity)));
      case PageConst.editProfile:
        return materialBuilder(
            widget: UserDetailsPage(
                args: UserDetailsPageArgs(
                    userDetailsFrom: UserDetailsFrom.editProfile,
                    user: args as UserEntity)));
      case PageConst.manageFields:
        return materialBuilder(widget: const ManageFieldsPage());
      case PageConst.manageGeneralFields:
        return materialBuilder(widget: ManageGeneralFieldsPage());
      case PageConst.manageRespiratoryFailureFields:
        return materialBuilder(widget: ManageRespiratoryFailureFieldsPage());
      case PageConst.manageSmokingFields:
        return materialBuilder(widget: ManageSmokingFieldsPage());

      default:
        return materialBuilder(widget: const ErrorPage());
    }
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Página não encontrada'),
      ),
    );
  }
}
