import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';

class SmokingOptionWidget extends StatelessWidget {
  final SmokingFromOption option;

  const SmokingOptionWidget({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14.0,
            backgroundColor: AppColors.slate600,
            child: Text(
              option == SmokingFromOption.traditional ? '1' : '2',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            option == SmokingFromOption.traditional
                ? 'Cigarro Tradicional'
                : 'Cigarro Eletrônico',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
