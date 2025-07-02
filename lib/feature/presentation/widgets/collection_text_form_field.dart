import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/widgets/collection_base_text_form_field.dart';

class CollectionTextFormField extends StatelessWidget {
  const CollectionTextFormField({
    super.key,
    required this.label,
    required this.required,
    required this.textEditingController,
    this.enabled = true,
    this.hintText,
    this.inputType,
    this.maxLength,
  });

  final String label;
  final bool required;
  final TextEditingController textEditingController;
  final bool enabled;
  final String? hintText;
  final InputType? inputType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "${required ? '*' : ''}$label",
          style: const TextStyle(
            color: AppColors.neutral600,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 8),
        CollectionBaseTextFormField(
          required: required,
          textEditingController: textEditingController,
          hintText: hintText,
          inputType: inputType,
          maxLength: maxLength,
          enabled: enabled,
        ),
      ],
    );
  }
}
