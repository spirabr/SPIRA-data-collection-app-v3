import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/widgets/app_bar_back_button.dart';

class SpiraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final VoidCallback? onBack;
  final AppBarBackButtonStyle backButtonStyle;

  const SpiraAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions = const [],
    this.onBack,
    this.backButtonStyle = AppBarBackButtonStyle.trashCan,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.neutral800,
          fontSize: 22,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ),
      bottom: subtitle != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(32),
              child: AutoSizeText(
                subtitle!,
                style: const TextStyle(
                  color: AppColors.neutral800,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : null,
      centerTitle: true,
      actions: actions,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 21,
          top: 9,
          bottom: 10,
        ),
        child:
            AppBarBackButton(onBack: onBack, backButtonStyle: backButtonStyle),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 32 + (subtitle != null ? 32 : 0));
}
