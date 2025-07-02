import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/smoker_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_two_text_form_fields.dart';

// ignore: must_be_immutable
class PatientDataCollection2Page extends StatelessWidget {
  PatientDataCollection2Page({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  "Dados do Paciente",
                  style: TextStyle(
                    color: AppColors.neutral800,
                    fontSize: 22,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CollectionTextFormField(
                  label: "Frequência Cardíaca (batimentos/minuto)",
                  required: true,
                  textEditingController:
                      context.read<DataCollectionCubit>().heartRateController,
                  inputType: InputType.number,
                  maxLength: 3,
                ),
                const SizedBox(height: 16),
                CollectionTextFormField(
                  label: "Frequência Respiratória (inspirações/minuto)",
                  required: true,
                  textEditingController: context
                      .read<DataCollectionCubit>()
                      .respiratoryRateController,
                  inputType: InputType.number,
                  maxLength: 3,
                ),
                const SizedBox(height: 16),
                CollectionTextFormField(
                  label: "Saturação (SpO2 em %)",
                  required: true,
                  textEditingController:
                      context.read<DataCollectionCubit>().saturationController,
                  inputType: InputType.number,
                  maxLength: 3,
                ),
                const SizedBox(height: 16),
                CollectionTwoTextFormFields(
                  label: "Pressão Arterial (mmHg)",
                  required: true,
                  firstTextEditingController: context
                      .read<DataCollectionCubit>()
                      .bloodPressureOneController,
                  secondTextEditingController: context
                      .read<DataCollectionCubit>()
                      .bloodPressureTwoController,
                  twoTextFieldsType: TwoTextFieldsType.slash,
                  firstMaxLength: 3,
                  secondMaxLength: 3,
                ),
                const SizedBox(height: 16),
                _buildSmokerSection(context),
                const SizedBox(height: 4)
              ],
            ),
          ),
        ),
        bottomNavigationBar: CollectionNavigationBar(onPressedNext: () {
          if (_formKey.currentState!.validate()) {
            context.read<DataCollectionCubit>().nextStep();
          }
        }, onPressedBack: () {
          context.read<DataCollectionCubit>().previousStep();
        }),
      ),
    );
  }

  Widget _buildSmokerSection(BuildContext context) {
    return SizedBox(
        child: FutureBuilder<List<SmokerEntity>>(
      future: context.read<DataCollectionCubit>().smokers,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionDropdown<SmokerEntity>(
            label: "Fumante",
            required: true,
            hintText: "Selecione",
            value: context.read<DataCollectionCubit>().state.smoker,
            items: snapshot.data!
                .map<DropdownMenuItem<SmokerEntity>>((SmokerEntity value) {
              return DropdownMenuItem<SmokerEntity>(
                value: value,
                child: Text(
                  value.name,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<DataCollectionCubit>().setSmoker(value);
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }
}
