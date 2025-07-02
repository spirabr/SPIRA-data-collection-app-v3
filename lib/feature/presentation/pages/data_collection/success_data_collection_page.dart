import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/widgets/colored_button.dart';
import 'package:spira/gen/assets.gen.dart';

class SuccessDataCollectionPage extends StatelessWidget {
  const SuccessDataCollectionPage({super.key, required this.step});

  final DataCollectionStep step;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 6,
                ),
                child: Assets.success.image(),
              ),
              const SizedBox(height: 70),
              const Text(
                "Sucesso!",
                style: TextStyle(
                  color: Color(0XFF1C2035),
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  step == DataCollectionStep.onlineSuccess
                      ? "Sua coleta foi salva e enviada com sucesso."
                      : "Sua coleta foi salva e será enviada quando seu dispositivo estiver conectado à internet.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.neutral800,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 38),
              ColoredButton(
                label: "Menu Principal",
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
