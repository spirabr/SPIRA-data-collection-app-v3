import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/converter_utils.dart';
import 'package:spira/feature/presentation/cubits/audio_recorder/audio_recorder_cubit.dart';
import 'package:spira/feature/presentation/widgets/recorder/recorder_initial_waveform.dart';
import 'package:spira/gen/assets.gen.dart';

class RecordingAudioWaveform extends StatelessWidget {
  const RecordingAudioWaveform({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioRecorderCubit, AudioRecorderState>(
      builder: (context, state) {
        if (state is AudioRecorderRecording) {
          return Flex(
            direction: Axis.vertical,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 80,
                  child: Assets.recorderRecording.image(
                      height: 10, color: Colors.black, fit: BoxFit.scaleDown)),
              Text(
                ConverterUtils.formatSeconds(state.duration!),
                style: const TextStyle(
                  color: AppColors.red600,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          );
        }

        return const RecorderInitialWaveform();
      },
    );
  }
}
