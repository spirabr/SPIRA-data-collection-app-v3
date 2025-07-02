import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/core/converter_utils.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/presentation/cubits/user_management/user_management_cubit.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.active,
    required this.user,
  });

  final UserEntity user;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(
        PageConst.userDetails,
        arguments: user,
      )
          .then((value) {
        if (value is bool && value) {
          GetIt.I.get<UserManagementCubit>().loadUsers();
        }
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: active ? Colors.white : AppColors.neutral50,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: AppColors.neutral200,
            width: 2,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.fullName,
                      style: const TextStyle(
                        color: AppColors.neutral900,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${ConverterUtils.getRoleName(user.roles.first)} • ${user.email}",
                      style: const TextStyle(
                        color: AppColors.neutral600,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: AppColors.blue500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
