import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';
import 'package:spira/feature/presentation/widgets/collection_text_form_field.dart';

// ignore: must_be_immutable
class CollectionLocationPage extends StatelessWidget {
  CollectionLocationPage({super.key, required this.onPressedPrevious});
  final VoidCallback onPressedPrevious;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Local da Coleta",
                style: TextStyle(
                  color: AppColors.neutral800,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              CollectionTextFormField(
                label: "Local",
                required: true,
                textEditingController: context
                    .read<DataCollectionCubit>()
                    .collectionLocationController,
                hintText: "Digite o local",
                maxLength: 40,
              ),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CollectionNavigationBar(
        onPressedNext: () {
          if (_formKey.currentState!.validate()) {
            context.read<DataCollectionCubit>().nextStep();
          }
        },
        onPressedBack: onPressedPrevious,
        firstPage: true,
      ),
    );
  }
}
