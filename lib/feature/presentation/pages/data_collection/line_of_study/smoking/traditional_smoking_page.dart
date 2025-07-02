import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_two_text_form_fields.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/smoking_option_widget.dart';

// ignore: must_be_immutable
class TraditionalSmokingPage extends StatelessWidget {
  TraditionalSmokingPage(
      {super.key, this.smokingFrom = SmokingFromOption.traditional});

  final SmokingFromOption smokingFrom;

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
                Text(
                  getTitleByOrigin(),
                  style: const TextStyle(
                    color: AppColors.neutral800,
                    fontSize: 22,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  getSubtitleByOrigin(),
                  style: const TextStyle(
                    color: AppColors.neutral800,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                getSmokingOptionWidget(),
                CollectionTextFormField(
                  label: "Carga Tabágica",
                  required: smokingFrom == SmokingFromOption.asthma ||
                          smokingFrom == SmokingFromOption.control
                      ? false
                      : true,
                  hintText: "Quantidade cigarros / dia",
                  textEditingController: context
                      .read<DataCollectionCubit>()
                      .traditionalTobaccoLoadController,
                  inputType: InputType.decimal,
                  maxLength: 6,
                ),
                const SizedBox(height: 16),
                CollectionTextFormField(
                  label: "Monóxido de Carbono (COex em ppm)",
                  required: smokingFrom == SmokingFromOption.asthma ||
                          smokingFrom == SmokingFromOption.control
                      ? false
                      : true,
                  hintText: "Escreva a quantidade",
                  textEditingController: context
                      .read<DataCollectionCubit>()
                      .traditionalCarbonMonoxideController,
                  inputType: InputType.decimal,
                  maxLength: 6,
                ),
                const SizedBox(height: 16),
                CollectionTwoTextFormFields(
                  label: "Tempo de consumo",
                  required: smokingFrom == SmokingFromOption.asthma ||
                          smokingFrom == SmokingFromOption.control
                      ? false
                      : true,
                  firstTextEditingController: context
                      .read<DataCollectionCubit>()
                      .traditionalConsumptionTimeOneController,
                  secondTextEditingController: context
                      .read<DataCollectionCubit>()
                      .traditionalConsumptionTimeTwoController,
                  twoTextFieldsType: TwoTextFieldsType.time,
                  firstMaxLength: 2,
                  secondMaxLength: 2,
                ),
                if (smokingFrom == SmokingFromOption.asthma ||
                    smokingFrom == SmokingFromOption.control)
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      const SizedBox(height: 16),
                      CollectionTwoTextFormFields(
                        label: "Tempo de cessação",
                        required: smokingFrom == SmokingFromOption.asthma ||
                                smokingFrom == SmokingFromOption.control
                            ? false
                            : true,
                        firstTextEditingController: context
                            .read<DataCollectionCubit>()
                            .traditionalCessationTimeOneController,
                        secondTextEditingController: context
                            .read<DataCollectionCubit>()
                            .traditionalCessationTimeTwoController,
                        twoTextFieldsType: TwoTextFieldsType.time,
                        firstMaxLength: 2,
                        secondMaxLength: 2,
                      ),
                    ],
                  ),
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

  String getTitleByOrigin() {
    switch (smokingFrom) {
      case SmokingFromOption.control:
        return "Dados do Sujeito";
      case SmokingFromOption.traditional:
      case SmokingFromOption.both:
      case SmokingFromOption.asthma:
      default:
        return "Dados do Paciente";
    }
  }

  String getSubtitleByOrigin() {
    switch (smokingFrom) {
      case SmokingFromOption.traditional:
        return "Tabagismo - Tradicional";
      case SmokingFromOption.both:
        return "Tabagismo - Ambos";
      case SmokingFromOption.asthma:
        return "Asma";
      case SmokingFromOption.control:
        return "Controle";
      default:
        return "";
    }
  }

  Widget getSmokingOptionWidget() {
    switch (smokingFrom) {
      case SmokingFromOption.both:
      case SmokingFromOption.asthma:
      case SmokingFromOption.control:
        return const SmokingOptionWidget(option: SmokingFromOption.traditional);
      default:
        return Container();
    }
  }
}
