import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spira/feature/core/app_colors.dart';

class UserTextField extends StatefulWidget {
  final TextEditingController controller;

  const UserTextField({super.key, required this.controller});

  @override
  _UserTextFieldState createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            'Usuário',
            style: TextStyle(
              color: AppColors.neutral600,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.30,
            ),
          ),
        ),
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(FontAwesomeIcons.solidUser),
            prefixIconColor:
                _focusNode.hasFocus ? AppColors.blue500 : AppColors.neutral400,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue500),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final FocusNode _focusNode = FocusNode();

  bool _passwordVisible = false;

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            'Senha',
            style: TextStyle(
              color: AppColors.neutral600,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.30,
            ),
          ),
        ),
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            prefixIcon: const Icon(FontAwesomeIcons.lock),
            prefixIconColor:
                _focusNode.hasFocus ? AppColors.blue500 : AppColors.neutral400,
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
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue500),
            ),
          ),
        ),
      ],
    );
  }
}
