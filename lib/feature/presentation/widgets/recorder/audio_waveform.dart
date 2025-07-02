import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/converter_utils.dart';

class AudioWaveform extends StatelessWidget {
  const AudioWaveform({super.key, required this.controller});

  final PlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        AudioFileWaveforms(
          size: Size(MediaQuery.of(context).size.width / 2, 80),
          playerController: controller,
          waveformType: WaveformType.long,
          continuousWaveform: false,
          playerWaveStyle: const PlayerWaveStyle(
            fixedWaveColor: AppColors.neutral800,
            liveWaveColor: AppColors.neutral500,
            spacing: 6,
          ),
        ),
        StreamBuilder(
          stream: controller.onCurrentDurationChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                ConverterUtils.formatMilliseconds(snapshot.data!),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              );
            }

            return const Text(
              '00:00',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            );
          },
        )
      ],
    );
  }
}
