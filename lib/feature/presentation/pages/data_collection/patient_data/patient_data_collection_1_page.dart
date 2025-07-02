import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/gender_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_comorbities_selector.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';

// ignore: must_be_immutable
class PatientDataCollection1Page extends StatelessWidget {
  PatientDataCollection1Page({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                label: "Identificador",
                required: true,
                textEditingController:
                    context.read<DataCollectionCubit>().identifierController,
                maxLength: 40,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildGenderSection(context)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CollectionTextFormField(
                      label: "Idade (anos)",
                      required: true,
                      textEditingController:
                          context.read<DataCollectionCubit>().ageController,
                      inputType: InputType.number,
                      maxLength: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CollectionTextFormField(
                      label: "Peso (kg)",
                      required: true,
                      textEditingController:
                          context.read<DataCollectionCubit>().weightController,
                      inputType: InputType.number,
                      maxLength: 3,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CollectionTextFormField(
                      label: "Altura (cm)",
                      required: true,
                      textEditingController:
                          context.read<DataCollectionCubit>().heightController,
                      inputType: InputType.number,
                      maxLength: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildComorbiditiesSection(context),
              const SizedBox(height: 16),
              CollectionTextFormField(
                label: "Comorbidade Adicional",
                required: false,
                textEditingController: context
                    .read<DataCollectionCubit>()
                    .additionalComorbidityController,
                hintText: 'Digite a comorbidade adicional',
                maxLength: 40,
              ),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CollectionNavigationBar(onPressedNext: () {
        _formKey.currentState!.save();
        if (_formKey.currentState!.validate()) {
          context.read<DataCollectionCubit>().nextStep();
        }
      }, onPressedBack: () {
        _formKey.currentState!.save();
        context.read<DataCollectionCubit>().previousStep();
      }),
    );
  }

  Widget _buildGenderSection(BuildContext context) {
    return SizedBox(
        child: FutureBuilder<List<GenderEntity>>(
      future: context.read<DataCollectionCubit>().genders,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionDropdown<GenderEntity>(
            label: "Sexo",
            required: true,
            hintText: "Selecione",
            value: context.read<DataCollectionCubit>().state.gender,
            items: snapshot.data!
                .map<DropdownMenuItem<GenderEntity>>((GenderEntity value) {
              return DropdownMenuItem<GenderEntity>(
                value: value,
                child: Text(
                  value.name,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<DataCollectionCubit>().setGender(value);
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildComorbiditiesSection(BuildContext context) {
    return FutureBuilder(
      future: context.read<DataCollectionCubit>().comorbidities,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionComorbiditiesSelector(
            comorbidities: snapshot.data!,
            onSaved: (newValue) {
              context.read<DataCollectionCubit>().setComorbidities(newValue!);
            },
            initialValue:
                context.watch<DataCollectionCubit>().state.comorbidities,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
