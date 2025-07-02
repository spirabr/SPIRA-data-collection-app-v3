import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RegisterPasswordTextFormField extends StatefulWidget {
  const RegisterPasswordTextFormField({
    super.key,
    required this.label,
    required this.required,
    required this.textEditingController,
    this.hintText,
    this.inputType,
    this.maxLength,
    this.password,
  });

  final String label;
  final bool required;
  final TextEditingController textEditingController;
  final String? hintText;
  final InputType? inputType;
  final int? maxLength;
  final TextEditingController? password;

  @override
  State<RegisterPasswordTextFormField> createState() =>
      _RegisterPasswordTextFormFieldState();
}

class _RegisterPasswordTextFormFieldState
    extends State<RegisterPasswordTextFormField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "${widget.required ? '*' : ''}${widget.label}",
          style: const TextStyle(
            color: AppColors.neutral600,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: TextFormField(
            obscureText: !_passwordVisible,
            controller: widget.textEditingController,
            inputFormatters: widget.maxLength != null
                ? [LengthLimitingTextInputFormatter(widget.maxLength)]
                : [],
            validator: (value) {
              if (widget.required && value != null && value.trim().isEmpty) {
                return "Campo obrigatório";
              } else if (widget.required && value != null && value.length < 6) {
                return "A senha deve ter no mínimo 6 caracteres";
              } else if (widget.password?.text != null &&
                  value != widget.password!.text) {
                return "As senhas devem ser iguais";
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
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: AppColors.neutral500,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible
                      ? FontAwesomeIcons.solidEyeSlash
                      : FontAwesomeIcons.solidEye,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
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
              fillColor: Colors.white,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
