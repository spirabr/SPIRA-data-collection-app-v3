import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_colors.dart';

class AudioRecorderNavigationButtons extends StatelessWidget {
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final bool lastStep;

  const AudioRecorderNavigationButtons({
    super.key,
    this.onPrevious,
    this.onNext,
    required this.lastStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPrevious,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                    (Set<MaterialState> states) {
                      return const EdgeInsets.symmetric(vertical: 16.0);
                    },
                  ),
                  side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.white),
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape:
                      MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                    (Set<MaterialState> states) {
                      return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      );
                    },
                  )),
              child: const Text('Anterior'),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: ElevatedButton(
              onPressed: onNext,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (onNext == null) {
                    return AppColors.neutral400;
                  }
                  return AppColors.blue500;
                },
              ), padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
                  return const EdgeInsets.symmetric(vertical: 16.0);
                },
              ), foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (onNext == null) {
                    return AppColors.neutral200;
                  }
                  return Colors.white;
                },
              ), shape:
                      MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                (Set<MaterialState> states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  );
                },
              )),
              child: Text(lastStep ? 'Finalizar' : 'Próximo'),
            ),
          ),
        ],
      ),
    );
  }
}
