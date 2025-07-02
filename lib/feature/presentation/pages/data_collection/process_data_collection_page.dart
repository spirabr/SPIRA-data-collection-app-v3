import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/gen/assets.gen.dart';

class ProcessDataCollectionPage extends StatefulWidget {
  const ProcessDataCollectionPage({super.key});

  @override
  State<ProcessDataCollectionPage> createState() =>
      _ProcessDataCollectionPageState();
}

class _ProcessDataCollectionPageState extends State<ProcessDataCollectionPage> {
  @override
  void initState() {
    super.initState();
    context.read<DataCollectionCubit>().submitCollectionData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCollectionCubit, DataCollectionState>(
        listenWhen: (previous, current) =>
            previous.loadState != current.loadState,
        listener: (context, state) {
          switch (state.loadState) {
            case SubmitLoadState.unauthenticated:
              ToastUtils.showAlertToast(
                  "Sessão expirada, faça login novamente");
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
              break;
            default:
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 38),
                    Gif(
                      autostart: Autostart.loop,
                      image: Assets.processando.provider(),
                    ),
                    const SizedBox(height: 38),
                    const Text(
                      "Processando Dados",
                      style: TextStyle(
                        color: AppColors.neutral800,
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "Só um momento!\nEstamos processando os dados que foram coletados",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.neutral500,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
