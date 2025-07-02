import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/presentation/cubits/manage_fields/manage_fields_cubit.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/manage_edit_list_button.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/manage_field_add.dart';
import 'package:spira/feature/presentation/widgets/save_form_bottombar.dart';

class ManageGeneralFieldsPage extends StatelessWidget {
  ManageGeneralFieldsPage({super.key});

  final ManageFieldsCubit cubit = ManageFieldsCubit()..fetchGeneralFields();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ManageFieldsCubit, ManageFieldsState>(
          bloc: cubit,
          builder: (context, state) {
            if (state.loadState == GenericLoadState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.loadState == GenericLoadState.error) {
              return const Center(child: Text("Erro ao carregar campos"));
            }
            return ListView(
              padding:
                  const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
              children: [
                const Text(
                  "Gerenciar Campos",
                  style: TextStyle(
                    color: AppColors.neutral800,
                    fontSize: 22,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Geral",
                  style: TextStyle(
                    color: AppColors.neutral800,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ManageFieldAdd(
                  label: "Sexo",
                  textEditingController: cubit.genderController,
                  onTap: () {
                    cubit.addGender(cubit.genderController.text);
                    cubit.genderController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getGenderList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) => cubit.updateGenderList(value),
                    hint: cubit
                        .getGenderList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
                const SizedBox(height: 8),
                ManageFieldAdd(
                  label: "Fumante",
                  textEditingController: cubit.smokingOptionController,
                  onTap: () {
                    cubit.addSmokerOption(cubit.smokingOptionController.text);
                    cubit.smokingOptionController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getSmokerOptionList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) => cubit.updateSmokerOptionList(value),
                    hint: cubit
                        .getSmokerOptionList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
                const SizedBox(height: 8),
                ManageFieldAdd(
                  label: "Linha de estudo",
                  textEditingController: cubit.studyLineController,
                  onTap: () {
                    cubit.addStudyLine(cubit.studyLineController.text);
                    cubit.studyLineController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getStudyLineList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) => cubit.updateStudyLineList(value),
                    hint: cubit
                        .getStudyLineList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
                const SizedBox(height: 4),
              ],
            );
          }),
      bottomNavigationBar: SaveFormBottomBar(
        onSavePressed: () {
          cubit.submitGeneralFields().then((value) {
            if (value is List<String>) {
              if (value.isNotEmpty) {
                ToastUtils.showAlertToast(value.join('\n'));
              } else {
                ToastUtils.showToast('Mudanças salvas com sucesso!');
              }
            }
            Navigator.of(context).pop();
          });
        },
        onCancelPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
