import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spira/feature/core/app_colors.dart';

class MenuButton extends StatelessWidget {
  final IconData? icon;
  final String primaryText;
  final String? secondaryText;
  final VoidCallback onPressed;

  MenuButton({
    this.icon,
    required this.primaryText,
    this.secondaryText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.slate400),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            if (icon != null) Icon(icon, color: AppColors.slate400),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    primaryText,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: AppColors.neutral800,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                  if (secondaryText != null) ...[
                    const SizedBox(height: 4.0),
                    Text(
                      secondaryText!,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.neutral800,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const CircleAvatar(
              radius: 16.0,
              backgroundColor: AppColors.blue500,
              child: Icon(FontAwesomeIcons.arrowRightLong,
                  color: Colors.white, size: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
