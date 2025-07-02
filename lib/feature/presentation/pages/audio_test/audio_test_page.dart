import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/presentation/cubits/audio_recorder/audio_recorder_cubit.dart';
import 'package:spira/feature/presentation/widgets/recorder/audio_waveform.dart';
import 'package:spira/feature/presentation/widgets/recorder/recorder_back_button.dart';
import 'package:spira/feature/presentation/widgets/recorder/recorder_initial_waveform.dart';
import 'package:spira/feature/presentation/widgets/recorder/recorder_section.dart';
import 'package:spira/feature/presentation/widgets/recorder/recording_audio_waveform.dart';
import 'package:spira/gen/assets.gen.dart';

class AudioTestPage extends StatefulWidget {
  const AudioTestPage({super.key});

  @override
  State<AudioTestPage> createState() => _AudioTestPageState();
}

class _AudioTestPageState extends State<AudioTestPage> {
  late AudioRecorderCubit _audioRecorderCubit;

  @override
  void initState() {
    _audioRecorderCubit = AudioRecorderCubit()..init();
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
          return PopScope(
            canPop: state is! AudioRecorderRecording,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(top: 38),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.backgroundWaves.provider(),
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.only(top: 38),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildAppBar(context),
                                const SizedBox(height: 24),
                                const Text(
                                  "Teste de Áudio",
                                  style: TextStyle(
                                    color: AppColors.neutral800,
                                    fontSize: 22,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  child: const Text(
                                    "Grave o áudio e ouça para garantir que não há falhas no dispositivo.",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.neutral800,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 94),
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
                          RecorderSection(
                            footer: RecorderBackButton(
                              onPressed: () {
                                if (state is! AudioRecorderRecording) {
                                  Navigator.of(context).pop();
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
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 36,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );
  }
}
