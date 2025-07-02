import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';
import 'package:spira/feature/presentation/pages/login/widgets/login_input_widget.dart';
import 'package:spira/feature/presentation/widgets/colored_button.dart';
import 'package:spira/gen/assets.gen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.loadState == GenericLoadState.success) {
              Navigator.of(context).pushNamed(PageConst.menuPage);
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.spira
                          .image(width: MediaQuery.of(context).size.width * .5),
                      const Text(
                        'Bem vindo ao SPIRA!\n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.neutral800,
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                      const Text(
                        'Insira o seu usuário e senha para acessar o aplicativo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.neutral500,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                      UserTextField(controller: _userController),
                      PasswordTextField(controller: _passwordController),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            state.loadState == GenericLoadState.error &&
                                    state.errorMessage.isNotEmpty
                                ? state.errorMessage
                                : " ",
                            style: const TextStyle(
                              color: AppColors.red600,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0),
                        child: ColoredButton(
                          label: 'Entrar',
                          onPressed: () {
                            context.read<AuthCubit>().login(
                                _userController.text, _passwordController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
