import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/widgets/collection_base_text_form_field.dart';

class CollectionThreeTextFormFields extends StatelessWidget {
  const CollectionThreeTextFormFields({
    super.key,
    required this.label,
    required this.required,
    required this.firstTextEditingController,
    required this.secondTextEditingController,
    required this.thirdTextEditingController,
    this.firstHintText,
    this.secondHintText,
    this.thirdHintText,
    this.firstInputType = InputType.number,
    this.secondInputType = InputType.number,
    this.thirdInputType = InputType.number,
    this.firstMaxLength,
    this.secondMaxLength,
    this.thirdMaxLength,
  });

  final String label;
  final bool required;
  final TextEditingController firstTextEditingController;
  final TextEditingController secondTextEditingController;
  final TextEditingController thirdTextEditingController;
  final String? firstHintText;
  final String? secondHintText;
  final String? thirdHintText;
  final InputType firstInputType;
  final InputType secondInputType;
  final InputType thirdInputType;
  final int? firstMaxLength;
  final int? secondMaxLength;
  final int? thirdMaxLength;

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
                inputType: firstInputType,
                maxLength: firstMaxLength,
              ),
            ),
            const Text(
              " - ",
              style: TextStyle(
                color: AppColors.neutral500,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: CollectionBaseTextFormField(
                required: required,
                textEditingController: secondTextEditingController,
                hintText: secondHintText,
                inputType: secondInputType,
                maxLength: secondMaxLength,
              ),
            ),
            const Text(
              " - ",
              style: TextStyle(
                color: AppColors.neutral500,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: CollectionBaseTextFormField(
                required: required,
                textEditingController: thirdTextEditingController,
                hintText: thirdHintText,
                inputType: thirdInputType,
                maxLength: thirdMaxLength,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
