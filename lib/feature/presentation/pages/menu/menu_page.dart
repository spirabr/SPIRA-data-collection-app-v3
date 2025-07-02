import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';
import 'package:spira/feature/presentation/cubits/menu/menu_cubit.dart';
import 'package:spira/feature/presentation/pages/menu/widgets/exit_button.dart';
import 'package:spira/feature/presentation/widgets/menu_button.dart';
import 'package:spira/gen/assets.gen.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        body: BlocConsumer<MenuCubit, MenuState>(
          bloc: GetIt.I.get<MenuCubit>()..loadUserRole(),
          listenWhen: (previous, current) => previous.loadState != current.loadState,
          listener: (context, state) {
            switch (state.loadState) {
              case GenericLoadState.unauthenticated:
                ToastUtils.showAlertToast(
                    "Sessão expirada, faça login novamente");
                GetIt.I<AuthCubit>().logout();
                Navigator.of(context).pushNamed('/login');
                break;
              default:
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 48.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.isAdmin)
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.solidUser,
                            color: AppColors.blue500,
                          ),
                          onPressed: () {
                            _goToProfile(context);
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Assets.spira
                          .image(width: MediaQuery.of(context).size.width * .4),
                    ),
                    const SizedBox(height: 48.0),
                    if (state.isUser) ...[
                      MenuButton(
                          icon: FontAwesomeIcons.microphoneLines,
                          primaryText: "Testar Áudio",
                          secondaryText: "Teste o seu áudio para evitar falhas",
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(PageConst.audioTestPage);
                          }),
                      const SizedBox(height: 12.0),
                      MenuButton(
                          icon: FontAwesomeIcons.plus,
                          primaryText: "Realizar Coleta",
                          secondaryText: "Formulário e gravação de áudio",
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(PageConst.dataCollectionPage);
                          }),
                    ],
                    if (state.isAdmin) ...[
                      if (state.isUser) const SizedBox(height: 12.0),
                      MenuButton(
                          icon: FontAwesomeIcons.plus,
                          primaryText: "Cadastrar Usuário",
                          secondaryText:
                              "Cadastrar novo usuário administrador ou coletador.",
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(PageConst.registerUser);
                          }),
                      const SizedBox(height: 12.0),
                      MenuButton(
                          icon: Icons.people_alt_rounded,
                          primaryText: "Gerenciar Usuários",
                          secondaryText:
                              "Visualizar, editar ou inativar usuários do aplicativo.",
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(PageConst.userManagement);
                          }),
                      const SizedBox(height: 12.0),
                      MenuButton(
                          icon: FontAwesomeIcons.gear,
                          primaryText: "Gerenciar Campos",
                          secondaryText:
                              "Cadastrar as opções dadas ao usuário no momento do preenchimento",
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(PageConst.manageFields);
                          }),
                      const SizedBox(height: 12.0),
                    ],
                    const Spacer(),
                    ExitButton(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _goToProfile(BuildContext context) async {
    UserEntity? user = await GetIt.I.get<MenuCubit>().loadUser();
    if (user != null) {
      Navigator.of(context).pushNamed(
        PageConst.profileDetails,
        arguments: user,
      );
    }
  }
}
