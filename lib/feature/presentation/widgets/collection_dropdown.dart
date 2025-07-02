import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';

class CollectionDropdown<T> extends StatelessWidget {
  const CollectionDropdown({
    super.key,
    required this.label,
    required this.required,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.enabled = true,
  });

  final String label;
  final bool required;
  final String hintText;
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: AutoSizeText(
            "${required ? '*' : ''}$label",
            style: const TextStyle(
              color: AppColors.neutral600,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: DropdownButtonFormField<T>(
            value: value,
            focusNode: FocusNode(),
            autofocus: true,
            icon: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.neutral400,
              ),
            ),
            style: const TextStyle(
              color: AppColors.neutral500,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
            validator: (value) {
              if (required && (value == null || value == '')) {
                return 'Campo obrigatório';
              }
              return null;
            },
            onChanged: enabled ? onChanged : null,
            items: items,
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
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        )
      ],
    );
  }
}
