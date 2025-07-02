import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/presentation/cubits/audio_recorder/audio_recorder_cubit.dart';
import 'package:spira/feature/presentation/widgets/confirmation_dialog.dart';
import 'package:spira/gen/assets.gen.dart';

class RecorderSection extends StatelessWidget {
  const RecorderSection({super.key, this.footer});

  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioRecorderCubit, AudioRecorderState>(
        builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.recorderBackground.provider(),
            fit: BoxFit.fill,
          ),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RecorderCircularButton(
                  icon: Icons.play_arrow,
                  onPressed: context.read<AudioRecorderCubit>().play,
                  active: state is AudioPlayerStopped ||
                      state is AudioRecorderStopped,
                ),
                RecorderMainButton(
                  startRecord: () {
                    if (state is AudioDeniedPermission) {
                      ToastUtils.showMicrophonePermissionIsNecessary();
                    }
                    if (state is! AudioPlayerPlaying) {
                      context.read<AudioRecorderCubit>().record();
                    }
                  },
                  stopRecord: context.read<AudioRecorderCubit>().stopRecorder,
                  recording: state is AudioRecorderRecording,
                ),
                RecorderCircularButton(
                  icon: Icons.close,
                  onPressed: () => showDiscardDialog(context),
                  active: state is AudioPlayerStopped ||
                      state is AudioRecorderStopped,
                ),
              ],
            ),
            if (footer != null) footer!
          ],
        ),
      );
    });
  }

  void showDiscardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return ConfirmationDialog(
          modalStyle: ModalStyle.red,
          title: "Tem certeza?",
          message: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Deseja ',
              style: TextStyle(color: AppColors.neutral600, fontSize: 16),
              children: <TextSpan>[
                TextSpan(
                  text: 'descartar, ',
                  style: TextStyle(
                      color: AppColors.red600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'o áudio gravado?\nEssa ação não poderá ser desfeita.',
                  style: TextStyle(color: AppColors.neutral600, fontSize: 16),
                ),
              ],
            ),
          ),
          confirmButtonText: "DESCARTAR ÁUDIO",
          cancelButtonText: "VOLTAR",
          onConfirmPressed: () {
            context.read<AudioRecorderCubit>().discard();
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

class RecorderMainButton extends StatelessWidget {
  const RecorderMainButton(
      {super.key,
      required this.startRecord,
      required this.stopRecord,
      required this.recording});

  final VoidCallback startRecord;
  final VoidCallback stopRecord;
  final bool recording;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: recording ? stopRecord : startRecord,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 138,
          width: 138,
          child: recording
              ? Assets.recorderStopButton.svg()
              : Assets.recorderStartButton.svg(),
        ),
      ),
    );
  }
}

class RecorderCircularButton extends StatelessWidget {
  const RecorderCircularButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.active});

  final IconData icon;
  final VoidCallback onPressed;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 44),
      child: IconButton(
        onPressed: active ? onPressed : null,
        constraints: const BoxConstraints(
          minHeight: 48,
          minWidth: 48,
        ),
        padding: const EdgeInsets.all(0),
        icon: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              24,
            ),
            border: Border.all(
              color: active ? Colors.white : AppColors.neutral400,
              width: 3,
            ),
          ),
          child: Icon(
            icon,
            color: active ? Colors.white : AppColors.neutral400,
          ),
        ),
      ),
    );
  }
}
