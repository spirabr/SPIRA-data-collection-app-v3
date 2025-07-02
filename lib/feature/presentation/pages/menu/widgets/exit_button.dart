import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';
import 'package:spira/feature/presentation/widgets/confirmation_dialog.dart';

class ExitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return ConfirmationDialog(
                title: "Sair",
                message: const Text(
                  "Tem certeza de que deseja sair?\nVocê será desconectado da sua conta.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
                confirmButtonText: "SAIR",
                cancelButtonText: "CANCELAR",
                onConfirmPressed: () {
                  context.read<AuthCubit>().logout().then((value) {
                    Navigator.of(context).popAndPushNamed(PageConst.loginPage);
                  });
                },
                onCancelPressed: () {
                  Navigator.of(context).pop();
                });
          },
        );
      },
      icon: const Icon(Icons.exit_to_app, color: AppColors.blue500),
      label: const Text('Sair', style: TextStyle(color: AppColors.blue500)),
      style: TextButton.styleFrom(
        backgroundColor: AppColors.blue100,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
