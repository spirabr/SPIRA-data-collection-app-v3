import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/presentation/cubits/manage_fields/manage_fields_cubit.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/manage_edit_list_button.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/manage_field_add.dart';
import 'package:spira/feature/presentation/widgets/save_form_bottombar.dart';

class ManageRespiratoryFailureFieldsPage extends StatelessWidget {
  ManageRespiratoryFailureFieldsPage({super.key});

  final ManageFieldsCubit cubit = ManageFieldsCubit()
    ..fetchRespiratoryFailureFields();

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
                  "Insuficiência Respiratória",
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
                  label: "Local de Internação",
                  textEditingController:
                      cubit.hospitalizationLocationController,
                  onTap: () {
                    cubit.addHospitalizationLocation(
                        cubit.hospitalizationLocationController.text);
                    cubit.hospitalizationLocationController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getHospitalizationLocationList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) =>
                        cubit.updateHospitalizationLocationList(value),
                    hint: cubit
                        .getHospitalizationLocationList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
                const SizedBox(height: 8),
                ManageFieldAdd(
                  label: "Tipo de Insuficiência Respiratória",
                  textEditingController:
                      cubit.respiratoryInsufficiencyTypeController,
                  onTap: () {
                    cubit.addRespiratoryInsufficiencyType(
                        cubit.respiratoryInsufficiencyTypeController.text);
                    cubit.respiratoryInsufficiencyTypeController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getRespiratoryInsufficiencyTypeList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) =>
                        cubit.updateRespiratoryInsufficiencyTypeList(value),
                    hint: cubit
                        .getRespiratoryInsufficiencyTypeList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
              ],
            );
          }),
      bottomNavigationBar: SaveFormBottomBar(
        onSavePressed: () {
          cubit.submitRespiratoryFailureFields().then((value) {
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
