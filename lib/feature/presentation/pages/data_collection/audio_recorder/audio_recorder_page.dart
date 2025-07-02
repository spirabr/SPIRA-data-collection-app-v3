import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/presentation/cubits/audio_recorder/audio_recorder_cubit.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/audio_recorder/widgets/audio_recorder_navigation_buttons.dart';
import 'package:spira/feature/presentation/widgets/confirmation_dialog.dart';
import 'package:spira/feature/presentation/widgets/recorder/audio_waveform.dart';
import 'package:spira/feature/presentation/widgets/recorder/recorder_initial_waveform.dart';
import 'package:spira/feature/presentation/widgets/recorder/recorder_section.dart';
import 'package:spira/feature/presentation/widgets/recorder/recording_audio_waveform.dart';
import 'package:spira/gen/assets.gen.dart';

class AudioRecorderPage extends StatefulWidget {
  const AudioRecorderPage({super.key, required this.type});

  final AudioRecorderType type;

  @override
  State<AudioRecorderPage> createState() => _AudioRecorderPageState();
}

class _AudioRecorderPageState extends State<AudioRecorderPage> {
  late AudioRecorderCubit _audioRecorderCubit;

  @override
  void initState() {
    _audioRecorderCubit = AudioRecorderCubit()
      ..init(
          maxDuration:
              widget.type == AudioRecorderType.ambientNoise ? 30 : null,
          dataCollectionCubitContext: context,
          type: widget.type);
    super.initState();
  }

  @override
  void dispose() {
    _audioRecorderCubit.stopPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _audioRecorderCubit,
      child: BlocConsumer<AudioRecorderCubit, AudioRecorderState>(
        listener: (context, state) {
          if (state is AudioDeniedPermission) {
            if (state.permissionStatus == PermissionStatus.denied) {
              ToastUtils.showMicrophonePermissionDeniedToast();
            } else if (state.permissionStatus ==
                PermissionStatus.permanentlyDenied) {
              ToastUtils.showMicrophonePermissionDeniedPermanentlyToast();
            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.backgroundWaves.provider(),
                        fit: BoxFit.cover,
                        alignment: Alignment.topRight,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 12),
                              const Text(
                                "Gravação de Áudio",
                                style: TextStyle(
                                  color: AppColors.neutral800,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 6),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Text(
                                  getSubtitleByType(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.neutral800,
                                    fontSize: 28,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              textToBeRecorderWidget(),
                              if (state is AudioRecorderStopped)
                                RecorderInitialWaveform(
                                  totalSeconds: state.duration,
                                ),
                              if (state is AudioPlayerStopped ||
                                  state is AudioPlayerPlaying)
                                AudioWaveform(
                                  controller: context
                                      .read<AudioRecorderCubit>()
                                      .controller,
                                ),
                              if (state is AudioRecorderReady)
                                const RecorderInitialWaveform(),
                              if (state is AudioRecorderRecording)
                                const RecordingAudioWaveform(),
                            ],
                          ),
                        ),
                        const Spacer(),
                        if (state is AudioRecorderReady &&
                            widget.type == AudioRecorderType.phrase)
                          skipStepButton(),
                        RecorderSection(
                          footer: AudioRecorderNavigationButtons(
                            lastStep: widget.type == AudioRecorderType.rhyme,
                            onNext: (state is AudioRecorderStopped ||
                                    state is AudioPlayerStopped ||
                                    state is AudioPlayerPlaying)
                                ? () {
                                    context
                                        .read<DataCollectionCubit>()
                                        .nextStep();
                                  }
                                : null,
                            onPrevious: () {
                              if (state is! AudioRecorderRecording) {
                                context
                                    .read<DataCollectionCubit>()
                                    .previousStep();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String getSubtitleByType() {
    switch (widget.type) {
      case AudioRecorderType.ambientNoise:
        return "Ruído ambiente";
      case AudioRecorderType.sustentainedVowel:
        return "Vogal sustentada";
      case AudioRecorderType.phrase:
        return "Frase";
      case AudioRecorderType.rhyme:
        return "Parlenda";
      default:
        return "";
    }
  }

  Widget textToBeRecorderWidget() {
    switch (widget.type) {
      case AudioRecorderType.phrase:
        return const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 12),
          child: AutoSizeText(
            "O amor ao próximo\najuda a enfrentar essa fase\ncom a força que a gente precisa.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
            maxLines: 3,
          ),
        );
      case AudioRecorderType.rhyme:
        return const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 12),
          child: AutoSizeText(
            "Batatinha quando nasce...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
            maxLines: 4,
          ),
        );
      default:
        return const SizedBox(height: 94);
    }
  }

  Widget skipStepButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {
          showSkipDialog();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (Set<MaterialState> states) {
                return const EdgeInsets.symmetric(vertical: 16.0);
              },
            ),
            side: MaterialStateProperty.all(
              const BorderSide(color: AppColors.slate900),
            ),
            foregroundColor: MaterialStateProperty.all(AppColors.slate900),
            shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
              (Set<MaterialState> states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                );
              },
            )),
        child: const Text('Pular'),
      ),
    );
  }

  void showSkipDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return ConfirmationDialog(
          title: "Atenção!",
          message: const Text(
            "Apesar de não ser obrigatório, esse passo é muito importante para a análise.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          confirmButtonText: "AVANÇAR PARA O PRÓXIMO",
          cancelButtonText: "REALIZAR COLETA DA FRASE",
          onConfirmPressed: () {
            context.read<DataCollectionCubit>().nextStep();
            Navigator.of(dialogContext).pop(true);
          },
          onCancelPressed: () {
            Navigator.of(dialogContext).pop(false);
          },
        );
      },
    );
  }
}
