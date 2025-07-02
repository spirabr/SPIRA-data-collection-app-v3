import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';

class CollectionBackButton extends StatelessWidget {
  const CollectionBackButton({
    super.key,
    required this.onPressed,
    this.firstPage = false,
  });

  final VoidCallback onPressed;
  final bool firstPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.blue50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 14,
          ),
        ),
        onPressed: onPressed,
        child: AutoSizeText(
          firstPage ? "Menu Principal" : "Anterior",
          style: const TextStyle(
            color: AppColors.blue500,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
