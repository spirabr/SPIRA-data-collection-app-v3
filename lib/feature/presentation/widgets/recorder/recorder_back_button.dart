import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/presentation/widgets/colored_button.dart';

class RecorderBackButton extends StatelessWidget {
  const RecorderBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.blue950,
      child: ColoredButton(
        label: "Voltar",
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
      ),
    );
  }
}
