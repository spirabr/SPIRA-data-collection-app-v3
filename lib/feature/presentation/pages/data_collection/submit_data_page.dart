import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/widgets/colored_button.dart';
import 'package:spira/gen/assets.gen.dart';

class SubmitDataPage extends StatelessWidget {
  const SubmitDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 32,
          ),
          child: Column(
            children: [
              const Spacer(),
              Assets.finalizarColeta
                  .image(height: MediaQuery.of(context).size.height * 0.3),
              const Spacer(),
              const Text(
                "Finalizar Coleta",
                style: TextStyle(
                  color: AppColors.neutral800,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.maxFinite,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Deseja finalizar a coleta?\nApós clicar em finalizar,\n",
                        style: TextStyle(
                          color: AppColors.neutral800,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "você não poderá retornar ao formulário.",
                        style: TextStyle(
                          color: AppColors.neutral800,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 46),
              ColoredButton(
                label: "Finalizar",
                onPressed: () => context.read<DataCollectionCubit>().nextStep(),
              ),
              const SizedBox(height: 8),
              ColoredButton(
                label: "Voltar",
                buttonColor: AppColors.blue100,
                textColor: AppColors.blue500,
                onPressed: () =>
                    context.read<DataCollectionCubit>().previousStep(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
