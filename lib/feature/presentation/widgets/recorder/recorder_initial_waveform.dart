import 'package:flutter/material.dart';
import 'package:spira/feature/core/converter_utils.dart';
import 'package:spira/gen/assets.gen.dart';

class RecorderInitialWaveform extends StatelessWidget {
  const RecorderInitialWaveform({super.key, this.totalSeconds});

  final int? totalSeconds;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: 80,
            child: Assets.recorderInitial
                .image(height: 10, color: Colors.black, fit: BoxFit.scaleDown)),
        Text(
          totalSeconds == null
              ? '00:00'
              : ConverterUtils.formatSeconds(totalSeconds!),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
