import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    this.onBack,
    this.backButtonStyle = AppBarBackButtonStyle.trashCan,
  });

  final VoidCallback? onBack;
  final AppBarBackButtonStyle backButtonStyle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBack ??
          () {
            Navigator.of(context).pop();
          },
      constraints: const BoxConstraints(
        minHeight: 38,
        minWidth: 38,
      ),
      padding: const EdgeInsets.all(0),
      icon: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.blue100,
          borderRadius: BorderRadius.circular(
            19,
          ),
        ),
        padding: backButtonStyle == AppBarBackButtonStyle.backArrow
            ? const EdgeInsets.only(left: 8)
            : null,
        child: Icon(
          getIcon(),
          color: AppColors.blue500,
        ),
      ),
    );
  }

  IconData getIcon() {
    switch (backButtonStyle) {
      case AppBarBackButtonStyle.trashCan:
        return FontAwesomeIcons.trashCan;
      case AppBarBackButtonStyle.backArrow:
        return Icons.arrow_back_ios;
    }
  }
}
