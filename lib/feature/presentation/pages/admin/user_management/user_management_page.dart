import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/cubits/user_management/user_management_cubit.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/user_management_list.dart';
import 'package:spira/feature/presentation/widgets/spira_app_bar.dart';

class UserManagementPage extends StatefulWidget {
  UserManagementPage({super.key});
  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  @override
  void initState() {
    GetIt.I.registerSingleton<UserManagementCubit>(
        UserManagementCubit()..loadUsers());
    super.initState();
  }

  @override
  void dispose() {
    GetIt.I.unregister<UserManagementCubit>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SpiraAppBar(
        title: "Gerenciar Usuários",
        backButtonStyle: AppBarBackButtonStyle.backArrow,
      ),
      body: BlocBuilder<UserManagementCubit, UserManagementState>(
        bloc: GetIt.I.get<UserManagementCubit>(),
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 20),
              _buildTabSection(state.currentTab),
              const SizedBox(height: 4),
              Expanded(
                child: BlocProvider<UserManagementCubit>(
                  create: (_) => GetIt.I.get<UserManagementCubit>(),
                  child: const UserManagementList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabSection(UserManagementTab currentTab) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
      decoration: BoxDecoration(
        color: AppColors.blue500,
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTabButton("Ativos", UserManagementTab.active, currentTab),
          _buildTabButton("Inativos", UserManagementTab.inactive, currentTab),
        ],
      ),
    );
  }

  Widget _buildTabButton(
    String label,
    UserManagementTab tabState,
    UserManagementTab currentTab,
  ) {
    final isSelected = tabState == currentTab;

    return Expanded(
      child: GestureDetector(
        onTap: () => GetIt.I.get<UserManagementCubit>().setActiveTab(tabState),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.neutral100 : AppColors.blue500,
            borderRadius: BorderRadius.circular(10.0),
            border: isSelected
                ? Border.all(color: AppColors.blue500, width: 2.0)
                : null,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.blue500 : AppColors.neutral100,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
