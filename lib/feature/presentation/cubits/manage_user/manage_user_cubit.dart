import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/data/model/request/edit_user_body.dart';
import 'package:spira/feature/data/model/request/new_user_body.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';
import 'package:spira/feature/domain/entities/role_entity.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/domain/usecases/patch_user_usecase.dart';
import 'package:spira/feature/domain/usecases/post_user_usecase.dart';
import 'package:spira/feature/domain/usecases/put_user_usecase.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';

part 'manage_user_state.dart';

class ManageUserCubit extends Cubit<ManageUserState> {
  ManageUserCubit() : super(ManageUserState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  List<RoleEntity> get roleEntities => [
        RoleEntity(id: 1, authority: "ROLE_ADMIN"),
        RoleEntity(id: 2, authority: "ROLE_USER"),
      ];

  void setUserDetailsFrom(UserDetailsFrom userDetailsFrom) {
    emit(state.copyWith(userDetailsFrom: userDetailsFrom));
  }

  void setUser(UserEntity user) {
    emit(state.copyWith(
        user: user, selectedRole: user.roles.first, active: user.active));
  }

  void setUserRole(RoleEntity userRole) {
    emit(state.copyWith(selectedRole: userRole));
  }

  void setActive(bool active) {
    emit(state.copyWith(active: active));
  }

  void toggleSwitch() {
    emit(state.copyWith(active: !state.active!));
  }

  Future submit() async {
    switch (state.userDetailsFrom) {
      case UserDetailsFrom.register:
        return await registerNewUser();
      case UserDetailsFrom.editUser:
      case UserDetailsFrom.editProfile:
        return await editUser();
      default:
        break;
    }
  }

  Future registerNewUser() async {
    NewUserBody body = NewUserBody(
      fullName: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      roleIds: [state.selectedRole!.id],
    );
    final PostUserUseCase postUserUseCase = GetIt.I.get<PostUserUseCase>();
    GenericResponseEntity? response = await postUserUseCase.call(body);

    if (response?.success == null || response?.success == false) {
      if (response?.authenticated == false) {
        await GetIt.I<AuthCubit>().logout();
        emit(state.copyWith(loadState: GenericLoadState.unauthenticated));
        return;
      }
      if (response?.message.toLowerCase().contains("email") ?? false) {
        return "E-mail já cadastrado";
      } else if (response?.message.toLowerCase().contains("name") ?? false) {
        return "Verifique o nome e tente novamente";
      } else if (response?.message.toLowerCase().contains("password") ??
          false) {
        return "Verifique a senha e tente novamente";
      }
      return response?.message;
    }
    return true;
  }

  Future editUser() async {
    EditUserBody body = EditUserBody(
      fullName: nameController.text,
      email: emailController.text,
      password:
          passwordController.text.isEmpty ? null : passwordController.text,
      roleIds: [state.selectedRole!.id],
      active: state.active,
    );

    final PutUserUseCase putUserUseCase = GetIt.I.get<PutUserUseCase>();
    GenericResponseEntity? response =
        await putUserUseCase.call(body, state.user!.id);

    if (state.active != state.user!.active) {
      final PatchUserUseCase patchUserUseCase = GetIt.I.get<PatchUserUseCase>();
      GenericResponseEntity? patchResponse =
          await patchUserUseCase.call(state.user!.id, state.active!);
      if (patchResponse?.success == null || patchResponse?.success == false) {
        if (patchResponse?.authenticated == false) {
          await GetIt.I<AuthCubit>().logout();
          emit(state.copyWith(loadState: GenericLoadState.unauthenticated));
          return;
        }
        return false;
      }
    }

    if (response?.success == null || response?.success == false) {
      if (response?.authenticated == false) {
        await GetIt.I<AuthCubit>().logout();
        emit(state.copyWith(loadState: GenericLoadState.unauthenticated));
        return;
      }
      if (response?.message.toLowerCase().contains("email") ?? false) {
        return "E-mail já cadastrado";
      } else if (response?.message.toLowerCase().contains("name") ?? false) {
        return "Verifique o nome e tente novamente";
      } else if (response?.message.toLowerCase().contains("password") ??
          false) {
        return "Verifique a senha e tente novamente";
      }
      return response?.message;
    }
    return true;
  }
}
