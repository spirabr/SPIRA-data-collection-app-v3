import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/core/converter_utils.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/domain/entities/role_entity.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/presentation/cubits/manage_user/manage_user_cubit.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';
import 'package:spira/feature/presentation/widgets/confirmation_dialog.dart';
import 'package:spira/feature/presentation/widgets/register_password_text_form_field.dart';
import 'package:spira/feature/presentation/widgets/save_form_bottombar.dart';
import 'package:spira/feature/presentation/widgets/spira_app_bar.dart';

class UserDetailsPageArgs {
  final UserDetailsFrom userDetailsFrom;
  final UserEntity? user;

  UserDetailsPageArgs({this.user, required this.userDetailsFrom});
}

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key, required this.args});

  final UserDetailsPageArgs args;

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  final ManageUserCubit cubit = ManageUserCubit();

  @override
  void initState() {
    if (widget.args.user != null) {
      cubit.nameController.text = widget.args.user!.fullName;
      cubit.emailController.text = widget.args.user!.email;
      cubit.setUser(widget.args.user!);
      cubit.setUserDetailsFrom(widget.args.userDetailsFrom);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpiraAppBar(
        onBack: widget.args.userDetailsFrom == UserDetailsFrom.register ||
                widget.args.userDetailsFrom == UserDetailsFrom.editUser ||
                widget.args.userDetailsFrom == UserDetailsFrom.editProfile
            ? () {
                _onBackPressed(context);
              }
            : null,
        title: getTitleString(),
        actions: showEditButton()
            ? [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 14,
                    top: 9,
                    bottom: 10,
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (widget.args.userDetailsFrom ==
                          UserDetailsFrom.profile) {
                        Navigator.of(context)
                            .pushNamed(
                          PageConst.editProfile,
                          arguments: widget.args.user,
                        )
                            .then((value) {
                          if (value is bool && value) {
                            Navigator.of(context).pop(value);
                          }
                        });
                      } else {
                        Navigator.of(context)
                            .pushNamed(
                          PageConst.editUser,
                          arguments: widget.args.user,
                        )
                            .then((value) {
                          if (value is bool && value) {
                            Navigator.of(context).pop(value);
                          }
                        });
                      }
                    },
                    icon: const Icon(
                      FontAwesomeIcons.pencil,
                      color: AppColors.blue500,
                    ),
                  ),
                ),
              ]
            : [],
      ),
      body: BlocListener<ManageUserCubit, ManageUserState>(
        bloc: cubit,
        listenWhen: (previous, current) =>
            previous.loadState != current.loadState,
        listener: (BuildContext context, state) {
          switch (state.loadState) {
            case GenericLoadState.unauthenticated:
              ToastUtils.showAlertToast(
                  "Sessão expirada, faça login novamente");
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
              break;
            default:
          }
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 20),
              if (widget.args.userDetailsFrom != UserDetailsFrom.editProfile &&
                  widget.args.userDetailsFrom != UserDetailsFrom.editUser) ...[
                _buildUserRoleInputSection(),
                const SizedBox(height: 4),
              ],
              CollectionTextFormField(
                label: "Nome",
                required: true,
                textEditingController: cubit.nameController,
                enabled: !readOnly(),
                maxLength: 50,
              ),
              const SizedBox(height: 4),
              CollectionTextFormField(
                label: "E-mail",
                required: true,
                textEditingController: cubit.emailController,
                inputType: InputType.email,
                enabled: !readOnly(),
                maxLength: 50,
              ),
              if (!readOnly()) ...[
                const SizedBox(height: 4),
                RegisterPasswordTextFormField(
                  required: passwordRequired(),
                  textEditingController: cubit.passwordController,
                  label: "Senha",
                  maxLength: 30,
                ),
                const SizedBox(height: 4),
                RegisterPasswordTextFormField(
                  required: passwordRequired(),
                  textEditingController: cubit.confirmPasswordController,
                  label: "Confirmar Senha",
                  password: cubit.passwordController,
                  maxLength: 30,
                ),
              ],
              if (showActiveSwitch()) _buildActiveSwitch()
            ],
          ),
        ),
      ),
      bottomNavigationBar: !readOnly()
          ? SaveFormBottomBar(
              onSavePressed: () {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  cubit.submit().then((value) {
                    if (value is bool) {
                      if (value) {
                        switch (widget.args.userDetailsFrom) {
                          case UserDetailsFrom.register:
                            ToastUtils.showToast("Usuário criado com sucesso!");
                          case UserDetailsFrom.editProfile:
                          case UserDetailsFrom.editUser:
                            ToastUtils.showToast(
                                "Usuário editado com sucesso!");
                          default:
                            break;
                        }
                      }
                      Navigator.of(context).pop(value);
                    } else if (value is String) {
                      ToastUtils.showAlertToast(value);
                    }
                  });
                }
              },
              onCancelPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
    );
  }

  Widget _buildActiveSwitch() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          const Text(
            "Usuário Ativo ",
            style: TextStyle(
              color: AppColors.neutral600,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          BlocBuilder<ManageUserCubit, ManageUserState>(
            bloc: cubit,
            buildWhen: (previous, current) => previous.active != current.active,
            builder: (context, state) {
              return Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColors.blue500,
                  value: state.active ?? false,
                  onChanged: (value) {
                    cubit.toggleSwitch();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUserRoleInputSection() {
    return CollectionDropdown<RoleEntity>(
      label: "Tipo de Perfil",
      required: true,
      hintText: "Selecione",
      value: cubit.state.selectedRole,
      items: cubit.roleEntities
          .map<DropdownMenuItem<RoleEntity>>((RoleEntity value) {
        return DropdownMenuItem<RoleEntity>(
          value: value,
          child: Text(
            ConverterUtils.getRoleName(value),
            textAlign: TextAlign.left,
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          cubit.setUserRole(value);
        }
      },
      enabled: !readOnly(),
    );
  }

  String getTitleString() {
    switch (widget.args.userDetailsFrom) {
      case UserDetailsFrom.userManagement:
        return "Detalhes Usuário";
      case UserDetailsFrom.profile:
        return "Meu Perfil";
      case UserDetailsFrom.register:
        return "Cadastrar novo usuário";
      case UserDetailsFrom.editProfile:
        return "Editar Perfil";
      case UserDetailsFrom.editUser:
        return "Editar Usuário";
    }
  }

  bool passwordRequired() {
    return widget.args.userDetailsFrom == UserDetailsFrom.register;
  }

  bool showEditButton() {
    return widget.args.userDetailsFrom == UserDetailsFrom.userManagement ||
        widget.args.userDetailsFrom == UserDetailsFrom.profile;
  }

  bool showActiveSwitch() {
    return widget.args.userDetailsFrom == UserDetailsFrom.editUser;
  }

  bool readOnly() {
    return widget.args.userDetailsFrom == UserDetailsFrom.profile ||
        widget.args.userDetailsFrom == UserDetailsFrom.userManagement;
  }

  Future _onBackPressed(BuildContext context) async {
    bool shouldPop = await showDialog(
      context: context,
      builder: (dialogContext) {
        return ConfirmationDialog(
          modalStyle: ModalStyle.red,
          title: "Tem certeza?",
          message: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Ao clicar em ',
              style: TextStyle(color: AppColors.neutral600, fontSize: 16),
              children: <TextSpan>[
                TextSpan(
                  text: 'sair e descartar',
                  style: TextStyle(
                      color: AppColors.neutral600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ', o formulário preenchido será ',
                  style: TextStyle(color: AppColors.neutral600, fontSize: 16),
                ),
                TextSpan(
                  text: 'descartado',
                  style: TextStyle(
                      color: AppColors.red600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(color: AppColors.neutral600, fontSize: 16),
                ),
              ],
            ),
          ),
          confirmButtonText: "SAIR E DESCARTAR",
          cancelButtonText: "CONTINUAR",
          onConfirmPressed: () {
            Navigator.of(dialogContext).pop(true);
          },
          onCancelPressed: () {
            Navigator.of(dialogContext).pop(false);
          },
        );
      },
    );

    if (shouldPop == true) {
      Navigator.of(context).pop();
    }
  }
}
