import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/widgets/app_bar_back_button.dart';

class CollectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CollectionAppBar({super.key, this.onBack});

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCollectionCubit, DataCollectionState>(
        buildWhen: (previous, current) => previous.step != current.step,
        builder: (context, state) {
          if (state.step == DataCollectionStep.processing ||
              state.step == DataCollectionStep.onlineSuccess ||
              state.step == DataCollectionStep.offlineSuccess) {
            return const SizedBox();
          }
          return AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leadingWidth: 57,
            leading: Padding(
              padding: const EdgeInsets.only(
                left: 21,
                top: 9,
                bottom: 10,
              ),
              child: AppBarBackButton(onBack: onBack),
            ),
            centerTitle: true,
            title: Container(
              height: 8,
              width: 204,
              decoration: BoxDecoration(
                color: AppColors.neutral200,
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  child: LinearProgressIndicator(
                    value: state.stepProgressValue,
                    backgroundColor: AppColors.neutral200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.blue950,
                    ),
                  )),
            ),
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
