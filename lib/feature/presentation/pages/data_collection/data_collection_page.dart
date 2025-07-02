import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/data/services/sync_data_service.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/audio_recorder/audio_recorder_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/line_of_study_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/respiratory_failure/respiratory_failure_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/smoking/electronic_smoking_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/smoking/smoking_last_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/smoking/smoking_type_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/line_of_study/smoking/traditional_smoking_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/patient_data/collection_location_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/patient_data/patient_data_collection_1_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/patient_data/patient_data_collection_2_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/process_data_collection_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/submit_data_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/success_data_collection_page.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_app_bar.dart';
import 'package:spira/feature/presentation/widgets/confirmation_dialog.dart';

class DataCollectionPage extends StatefulWidget {
  const DataCollectionPage({super.key});

  @override
  State<DataCollectionPage> createState() => _DataCollectionPageState();
}

class _DataCollectionPageState extends State<DataCollectionPage> {
  @override
  void initState() {
    GetIt.I.get<SyncDataService>().setCollecting(true);
    print("DataCollectionPage initState");
    super.initState();
  }

  @override
  void dispose() {
    GetIt.I.get<SyncDataService>().setCollecting(false);
    print("DataCollectionPage dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: SafeArea(
          child: BlocProvider(
              create: (_) => DataCollectionCubit(),
              child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: CollectionAppBar(
                    onBack: () async {
                      _onBackPressed(context);
                    },
                  ),
                  body: BlocBuilder<DataCollectionCubit, DataCollectionState>(
                    buildWhen: (previous, current) =>
                        previous.step != current.step,
                    builder: (context, state) {
                      switch (state.step) {
                        case DataCollectionStep.patientDataStepOne:
                          return CollectionLocationPage(
                            onPressedPrevious: () {
                              _onBackPressed(context);
                            },
                          );
                        case DataCollectionStep.patientDataStepTwo:
                          return PatientDataCollection1Page();
                        case DataCollectionStep.patientDataStepThree:
                          return PatientDataCollection2Page();
                        case DataCollectionStep.lineOfStudy:
                          return LineOfStudyPage();
                        case DataCollectionStep.respiratoryFailure:
                          return RespiratoryFailurePage();
                        case DataCollectionStep.smokingType:
                          return SmokingTypePage();
                        case DataCollectionStep.traditionalSmoking:
                          return TraditionalSmokingPage();
                        case DataCollectionStep.electronicSmoking:
                          return ElectronicSmokingPage();
                        case DataCollectionStep.bothTraditionalSmoking:
                          return TraditionalSmokingPage(
                              smokingFrom: SmokingFromOption.both);
                        case DataCollectionStep.bothElectronicSmoking:
                          return ElectronicSmokingPage(
                              smokingFrom: SmokingFromOption.both);
                        case DataCollectionStep.smokingLastStep:
                          return SmokingLastPage();
                        case DataCollectionStep.asthmaTraditionalSmoking:
                          return TraditionalSmokingPage(
                              smokingFrom: SmokingFromOption.asthma);
                        case DataCollectionStep.asthmaElectronicSmoking:
                          return ElectronicSmokingPage(
                              smokingFrom: SmokingFromOption.asthma);
                        case DataCollectionStep.controlTraditionalSmoking:
                          return TraditionalSmokingPage(
                              smokingFrom: SmokingFromOption.control);
                        case DataCollectionStep.controlElectronicSmoking:
                          return ElectronicSmokingPage(
                              smokingFrom: SmokingFromOption.control);
                        case DataCollectionStep.ambientNoise:
                          return const AudioRecorderPage(
                              key: Key("ambientNoise"),
                              type: AudioRecorderType.ambientNoise);
                        case DataCollectionStep.sustentainedVowel:
                          return const AudioRecorderPage(
                              key: Key("sustentainedVowel"),
                              type: AudioRecorderType.sustentainedVowel);
                        case DataCollectionStep.phrase:
                          return const AudioRecorderPage(
                              key: Key("phrase"),
                              type: AudioRecorderType.phrase);
                        case DataCollectionStep.rhyme:
                          return const AudioRecorderPage(
                              key: Key("rhyme"), type: AudioRecorderType.rhyme);
                        case DataCollectionStep.submitData:
                          return const SubmitDataPage();
                        case DataCollectionStep.processing:
                          return const ProcessDataCollectionPage();
                        case DataCollectionStep.onlineSuccess:
                        case DataCollectionStep.offlineSuccess:
                          return SuccessDataCollectionPage(step: state.step);
                        default:
                      }
                      return Container();
                    },
                  )))),
    );
  }

  Future _onBackPressed(BuildContext context) async {
    bool shouldPop = await showDialog(
      context: context,
      builder: (dialogContext) {
        return ConfirmationDialog(
          modalStyle: ModalStyle.red,
          title: "Tem certeza?",
          message: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Ao clicar em ',
              style: TextStyle(color: AppColors.neutral600, fontSize: 16),
              children: <TextSpan>[
                TextSpan(
                  text: 'sair e descartar',
                  style: TextStyle(
                      color: AppColors.neutral600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ', o formulário preenchido será ',
                  style: TextStyle(color: AppColors.neutral600, fontSize: 16),
                ),
                TextSpan(
                  text: 'excluído ',
                  style: TextStyle(
                      color: AppColors.red600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'e você irá retornar ao menu inicial.',
                  style: TextStyle(color: AppColors.neutral600, fontSize: 16),
                ),
              ],
            ),
          ),
          confirmButtonText: "SAIR E DESCARTAR",
          cancelButtonText: "CONTINUAR COLETA",
          onConfirmPressed: () {
            Navigator.of(dialogContext).pop(true);
          },
          onCancelPressed: () {
            Navigator.of(dialogContext).pop(false);
          },
        );
      },
    );

    if (shouldPop == true) {
      Navigator.of(context).pop();
    }
  }
}
