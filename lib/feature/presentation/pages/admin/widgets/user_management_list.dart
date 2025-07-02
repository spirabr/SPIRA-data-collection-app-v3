import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/presentation/cubits/user_management/user_management_cubit.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/user_list_item.dart';

class UserManagementList extends StatelessWidget {
  const UserManagementList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserManagementCubit, UserManagementState>(
      builder: (context, state) {
        final users = state.currentTab == UserManagementTab.active
            ? context.read<UserManagementCubit>().getActiveUsers()
            : context.read<UserManagementCubit>().getInactiveUsers();
        return LayoutBuilder(
          builder: (context, constraints) => RefreshIndicator(
            onRefresh: () async {
              context.read<UserManagementCubit>().loadUsers();
            },
            child: buildBody(state, users, constraints),
          ),
        );
      },
      listenWhen: (previous, current) =>
          previous.loadState != current.loadState,
      listener: (BuildContext context, UserManagementState state) {
        switch (state.loadState) {
          case GenericLoadState.unauthenticated:
            ToastUtils.showAlertToast("Sessão expirada, faça login novamente");
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);
            break;
          default:
        }
      },
    );
  }

  Widget buildBody(UserManagementState state, List<UserEntity> users,
      BoxConstraints constraints) {
    switch (state.loadState) {
      case GenericLoadState.idle:
      case GenericLoadState.initial:
      case GenericLoadState.loading:
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: const Center(child: CircularProgressIndicator()),
        );
      case GenericLoadState.success:
        return users.isEmpty
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight,
                  ),
                  child: const Center(
                      child: Text(
                    "Nenhum usuário encontrado",
                    style: TextStyle(
                      color: AppColors.neutral900,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return BlocProvider<UserManagementCubit>(
                    create: (_) => context.read<UserManagementCubit>(),
                    child: UserListItem(
                      user: users[index],
                      active: state.currentTab == UserManagementTab.active,
                    ),
                  );
                },
              );
      case GenericLoadState.error:
      case GenericLoadState.unauthenticated:
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: const Center(
                child: Text(
              "Ocorreu um erro, tente novamente mais tarde",
              style: TextStyle(
                color: AppColors.neutral900,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        );
    }
  }
}
