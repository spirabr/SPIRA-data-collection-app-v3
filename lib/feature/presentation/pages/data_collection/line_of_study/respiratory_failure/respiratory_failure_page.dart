import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/hospitalization_location_entity.dart';
import 'package:spira/feature/domain/entities/respiratory_failure_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_three_text_form_fields.dart';

// ignore: must_be_immutable
class RespiratoryFailurePage extends StatelessWidget {
  RespiratoryFailurePage({super.key});

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
              CollectionThreeTextFormFields(
                label: "Gasometria",
                required: false,
                firstTextEditingController:
                    context.read<DataCollectionCubit>().bloodGasOneController,
                secondTextEditingController:
                    context.read<DataCollectionCubit>().bloodGasTwoController,
                thirdTextEditingController:
                    context.read<DataCollectionCubit>().bloodGasThreeController,
                firstHintText: "PaO2",
                secondHintText: "PaCO2",
                thirdHintText: "PH",
                firstMaxLength: 3,
                secondMaxLength: 3,
                thirdMaxLength: 6,
                thirdInputType: InputType.decimal,
              ),
              const SizedBox(height: 16),
              CollectionTextFormField(
                label: "Número de dias de internação",
                required: true,
                textEditingController: context
                    .read<DataCollectionCubit>()
                    .hospitalizationDaysController,
                inputType: InputType.number,
                maxLength: 3,
              ),
              const SizedBox(height: 16),
              _buildHospitalizationLocationSection(context),
              const SizedBox(height: 16),
              _buildRespiratoryFailureTypeSection(context),
              const SizedBox(height: 16),
              CollectionTextFormField(
                label: "Avaliação Hemodinâmica",
                required: false,
                textEditingController: context
                    .read<DataCollectionCubit>()
                    .hemodynamicEvaluationController,
                hintText: 'Escreva a sua avaliação',
                maxLength: 40,
              ),
              const SizedBox(height: 16),
              CollectionTextFormField(
                label: "Diagnóstico Médico (CID)",
                required: false,
                textEditingController: context
                    .read<DataCollectionCubit>()
                    .medicalDiagnosisController,
                hintText: 'Escreva seu diagnóstico',
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

  Widget _buildHospitalizationLocationSection(BuildContext context) {
    return SizedBox(
        child: FutureBuilder<List<HospitalizationLocationEntity>>(
      future: context.read<DataCollectionCubit>().hospitalizationLocations,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionDropdown<HospitalizationLocationEntity>(
            label: "Local de internação",
            required: true,
            hintText: "Selecione",
            value: context
                .read<DataCollectionCubit>()
                .state
                .hospitalizationLocation,
            items: snapshot.data!
                .map<DropdownMenuItem<HospitalizationLocationEntity>>(
                    (HospitalizationLocationEntity value) {
              return DropdownMenuItem<HospitalizationLocationEntity>(
                value: value,
                child: Text(
                  value.name,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context
                    .read<DataCollectionCubit>()
                    .setHospitalizationLocation(value);
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildRespiratoryFailureTypeSection(BuildContext context) {
    return SizedBox(
        child: FutureBuilder<List<RespiratoryFailureEntity>>(
      future: context.read<DataCollectionCubit>().respiratoryFailures,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionDropdown<RespiratoryFailureEntity>(
            label: "Tipo de Insuficiência Respiratória​",
            required: false,
            hintText: "Selecione",
            value: context.read<DataCollectionCubit>().state.respiratoryFailure,
            items: snapshot.data!
                .map<DropdownMenuItem<RespiratoryFailureEntity>>(
                    (RespiratoryFailureEntity value) {
              return DropdownMenuItem<RespiratoryFailureEntity>(
                value: value,
                child: Text(
                  value.name,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context
                    .read<DataCollectionCubit>()
                    .setRespiratoryFailure(value);
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
