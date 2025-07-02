import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/presentation/widgets/collection_base_text_form_field.dart';

class ManageFieldAdd extends StatelessWidget {
  const ManageFieldAdd({
    super.key,
    required this.label,
    required this.textEditingController,
    required this.onTap,
    this.maxLength,
  });

  final String label;
  final TextEditingController textEditingController;
  final VoidCallback onTap;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          label,
          style: const TextStyle(
            color: AppColors.neutral800,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 8),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: CollectionBaseTextFormField(
                required: false,
                textEditingController: textEditingController,
                hintText: "Escreva a opção que deseja adicionar",
                maxLength: maxLength,
              ),
            ),
            IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: AppColors.blue500,
                  size: 36,
                ))
          ],
        )
      ],
    );
  }
}
