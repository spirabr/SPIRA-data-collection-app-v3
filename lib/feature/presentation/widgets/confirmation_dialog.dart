import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final Widget message;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirmPressed;
  final VoidCallback onCancelPressed;
  final ModalStyle modalStyle;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirmPressed,
    required this.onCancelPressed,
    this.modalStyle = ModalStyle.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 24.0,
              backgroundColor: AppColors.slate200,
              child: Icon(FontAwesomeIcons.exclamation,
                  color: AppColors.slate800, size: 30.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              title,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            message,
            const SizedBox(height: 24.0),
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: onConfirmPressed,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: modalStyle == ModalStyle.blue
                          ? AppColors.blue500
                          : AppColors.red600,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                    ),
                    child: Text(
                      confirmButtonText,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: onCancelPressed,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: AppColors.blue100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                    ),
                    child: Text(
                      cancelButtonText,
                      style: const TextStyle(
                          color: AppColors.blue500, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
