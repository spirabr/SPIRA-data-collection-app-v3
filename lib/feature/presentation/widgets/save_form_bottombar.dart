import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/presentation/widgets/colored_button.dart';

class SaveFormBottomBar extends StatelessWidget {
  const SaveFormBottomBar({
    super.key,
    required this.onSavePressed,
    required this.onCancelPressed,
  });

  final VoidCallback onSavePressed;
  final VoidCallback onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: double.maxFinite,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 20,
      ),
      child: Column(
        children: [
          Expanded(
              child: ColoredButton(
            label: "Salvar",
            onPressed: onSavePressed,
          )),
          const SizedBox(height: 8),
          Expanded(
              child: ColoredButton(
            label: "Cancelar",
            onPressed: onCancelPressed,
            textColor: AppColors.blue500,
            buttonColor: AppColors.blue100,
          )),
        ],
      ),
    );
  }
}
