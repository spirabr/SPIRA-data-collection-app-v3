import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';

class ColoredButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? buttonColor;
  final Color? textColor;

  const ColoredButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.buttonColor,
      this.textColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.blue500,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: AutoSizeText(
          label,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: -0.30,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
