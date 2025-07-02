import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Precisa de ajuda?\n',
            style: TextStyle(
              color: AppColors.neutral600,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.30,
            ),
          ),
          TextSpan(
            text: 'contato@email.com',
            style: TextStyle(
              color: Color(0xFF475569),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: -0.30,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
