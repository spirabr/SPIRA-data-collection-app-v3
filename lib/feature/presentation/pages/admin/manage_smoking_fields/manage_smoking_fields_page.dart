import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/presentation/cubits/manage_fields/manage_fields_cubit.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/manage_edit_list_button.dart';
import 'package:spira/feature/presentation/pages/admin/widgets/manage_field_add.dart';
import 'package:spira/feature/presentation/widgets/save_form_bottombar.dart';

class ManageSmokingFieldsPage extends StatelessWidget {
  ManageSmokingFieldsPage({super.key});

  final ManageFieldsCubit cubit = ManageFieldsCubit()..fetchSmokingFields();

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
                  "Tabagismo",
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
                  label: "Tipo",
                  textEditingController: cubit.smokingTypeController,
                  onTap: () {
                    cubit.addSmokingType(cubit.smokingTypeController.text);
                    cubit.smokingTypeController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getSmokingTypeList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) => cubit.updateSmokingTypeList(value),
                    hint: cubit
                        .getSmokingTypeList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
                const SizedBox(height: 8),
                ManageFieldAdd(
                  label: "Quantidade de Nicotina",
                  textEditingController: cubit.nicotineAmountController,
                  onTap: () {
                    cubit
                        .addNicotineAmount(cubit.nicotineAmountController.text);
                    cubit.nicotineAmountController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getNicotineAmountList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) =>
                        cubit.updateNicotineAmountList(value),
                    hint: cubit
                        .getNicotineAmountList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
                const SizedBox(height: 8),
                ManageFieldAdd(
                  label: "Tempo de cessação do cigarro",
                  textEditingController: cubit.cessationTimeController,
                  onTap: () {
                    cubit.addCessationTime(cubit.cessationTimeController.text);
                    cubit.cessationTimeController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getCessationTimeList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) => cubit.updateCessationTimeList(value),
                    hint: cubit
                        .getCessationTimeList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
                const SizedBox(height: 8),
                ManageFieldAdd(
                  label: "Percepção sobre sua saúde",
                  textEditingController: cubit.healthPerceptionController,
                  onTap: () {
                    cubit.addHealthPerception(
                        cubit.healthPerceptionController.text);
                    cubit.healthPerceptionController.clear();
                  },
                  maxLength: 30,
                ),
                ManageEditListButton(
                    items: cubit.getHealthPerceptionList(),
                    displayProperty: (obj) => obj.name,
                    updateList: (value) =>
                        cubit.updateHealthPerceptionList(value),
                    hint: cubit
                        .getHealthPerceptionList()
                        .keys
                        .map((obj) => obj.name)
                        .join(', ')),
              ],
            );
          }),
      bottomNavigationBar: SaveFormBottomBar(
        onSavePressed: () {
          cubit.submitSmokingFields().then((value) {
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
