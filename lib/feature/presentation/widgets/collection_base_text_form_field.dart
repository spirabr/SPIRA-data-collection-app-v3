import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';

class CollectionBaseTextFormField extends StatelessWidget {
  const CollectionBaseTextFormField({
    super.key,
    required this.required,
    required this.textEditingController,
    this.enabled = true,
    this.hintText,
    this.inputType,
    this.maxLength,
  });

  final bool required;
  final TextEditingController textEditingController;
  final bool enabled;
  final String? hintText;
  final InputType? inputType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextFormField(
        readOnly: !enabled,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        controller: textEditingController,
        validator: (value) {
          if (required && value != null && value.trim().isEmpty) {
            return "Campo obrigatório";
          } else if (inputType == InputType.email && value != null) {
            final emailRegex = RegExp(
                r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
            if (!emailRegex.hasMatch(value)) {
              return "Email inválido";
            }
          }
          return null;
        },
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style: const TextStyle(
          color: AppColors.neutral500,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.neutral500,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
            borderSide: const BorderSide(
              color: AppColors.slate200,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
            borderSide: const BorderSide(
              color: AppColors.slate200,
              width: 2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
            borderSide: const BorderSide(
              color: AppColors.slate200,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
            borderSide: const BorderSide(
              color: AppColors.slate200,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: enabled ? Colors.white : AppColors.slate200,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  TextInputType get keyboardType {
    switch (inputType) {
      case InputType.number:
        return TextInputType.number;
      case InputType.decimal:
        return const TextInputType.numberWithOptions(decimal: true);
      case InputType.text:
        return TextInputType.text;
      case InputType.email:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> get inputFormatters {
    switch (inputType) {
      case InputType.number:
        return maxLength != null
            ? [
                LengthLimitingTextInputFormatter(maxLength),
                FilteringTextInputFormatter.digitsOnly
              ]
            : [FilteringTextInputFormatter.digitsOnly];
      case InputType.decimal:
        return maxLength != null
            ? [
                LengthLimitingTextInputFormatter(maxLength),
                DecimalTextInputFormatter(
                    maxDigitsBeforeDecimal: maxLength! - 3,
                    maxDigitsAfterDecimal: 2),
              ]
            : [FilteringTextInputFormatter.allow(RegExp(r'^\d+[,.]?\d{0,2}'))];
      default:
        return maxLength != null
            ? [LengthLimitingTextInputFormatter(maxLength)]
            : [];
    }
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final int maxDigitsBeforeDecimal;
  final int maxDigitsAfterDecimal;

  DecimalTextInputFormatter({
    required this.maxDigitsBeforeDecimal,
    required this.maxDigitsAfterDecimal,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    final regExp = RegExp(r'^\d{0,' +
        maxDigitsBeforeDecimal.toString() +
        r'}([,.]\d{0,' +
        maxDigitsAfterDecimal.toString() +
        r'})?$');
    if (regExp.hasMatch(newText)) {
      return newValue;
    }
    return oldValue;
  }
}
