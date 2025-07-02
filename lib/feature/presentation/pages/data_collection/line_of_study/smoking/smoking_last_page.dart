import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/health_perception_entity.dart';
import 'package:spira/feature/domain/entities/smoking_cessation_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';

// ignore: must_be_immutable
class SmokingLastPage extends StatelessWidget {
  SmokingLastPage({super.key});

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
                CollectionTextFormField(
                  label: "Semana de participação no programa antitabagismo",
                  required: false,
                  textEditingController: context
                      .read<DataCollectionCubit>()
                      .antiSmokingWeeksController,
                  inputType: InputType.decimal,
                  maxLength: 6,
                ),
                const SizedBox(height: 16),
                _buildSmokingCessationInputSection(context),
                const SizedBox(height: 16),
                _buildHealthPerceptionInputSection(context),
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

  Widget _buildSmokingCessationInputSection(BuildContext context) {
    return SizedBox(
        child: FutureBuilder<List<SmokingCessationEntity>>(
      future: context.read<DataCollectionCubit>().smokingCessations,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionDropdown<SmokingCessationEntity>(
            label: "Tempo de cessação do cigarro",
            required: false,
            hintText: "Selecione",
            value: context.read<DataCollectionCubit>().state.smokingCessation,
            items: snapshot.data!.map<DropdownMenuItem<SmokingCessationEntity>>(
                (SmokingCessationEntity value) {
              return DropdownMenuItem<SmokingCessationEntity>(
                value: value,
                child: Text(
                  value.name,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<DataCollectionCubit>().setSmokingCessation(value);
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildHealthPerceptionInputSection(BuildContext context) {
    return SizedBox(
        child: FutureBuilder<List<HealthPerceptionEntity>>(
      future: context.read<DataCollectionCubit>().healthPerceptions,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionDropdown<HealthPerceptionEntity>(
            label: "Percepção sobre sua saúde",
            required: false,
            hintText: "Selecione",
            value: context.read<DataCollectionCubit>().state.healthPerception,
            items: snapshot.data!.map<DropdownMenuItem<HealthPerceptionEntity>>(
                (HealthPerceptionEntity value) {
              return DropdownMenuItem<HealthPerceptionEntity>(
                value: value,
                child: Text(
                  value.name,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<DataCollectionCubit>().setHealthPerception(value);
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
