import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/widgets/collection_base_text_form_field.dart';

class CollectionTwoTextFormFields extends StatelessWidget {
  const CollectionTwoTextFormFields({
    super.key,
    required this.label,
    required this.required,
    required this.firstTextEditingController,
    required this.secondTextEditingController,
    this.firstHintText,
    this.secondHintText,
    this.inputType = InputType.number,
    required this.twoTextFieldsType,
    this.firstMaxLength,
    this.secondMaxLength,
  });

  final String label;
  final bool required;
  final TextEditingController firstTextEditingController;
  final TextEditingController secondTextEditingController;
  final String? firstHintText;
  final String? secondHintText;
  final InputType inputType;
  final TwoTextFieldsType twoTextFieldsType;
  final int? firstMaxLength;
  final int? secondMaxLength;

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
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: CollectionBaseTextFormField(
                required: required,
                textEditingController: firstTextEditingController,
                hintText: firstHintText,
                inputType: inputType,
                maxLength: firstMaxLength,
              ),
            ),
            if (twoTextFieldsType == TwoTextFieldsType.slash)
              const Text(
                "/",
                style: TextStyle(
                  color: AppColors.neutral500,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            if (twoTextFieldsType == TwoTextFieldsType.time)
              const Text(
                "anos e",
                style: TextStyle(
                  color: AppColors.neutral500,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            Expanded(
              child: CollectionBaseTextFormField(
                required: required,
                textEditingController: secondTextEditingController,
                hintText: secondHintText,
                inputType: inputType,
                maxLength: secondMaxLength,
              ),
            ),
            if (twoTextFieldsType == TwoTextFieldsType.time)
              const Text(
                "meses",
                style: TextStyle(
                  color: AppColors.neutral500,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
