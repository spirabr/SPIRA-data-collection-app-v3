import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/domain/entities/line_of_study_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';

// ignore: must_be_immutable
class LineOfStudyPage extends StatelessWidget {
  LineOfStudyPage({super.key});

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
                "Linha de Estudo",
                style: TextStyle(
                  color: AppColors.neutral800,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              _buildLineOfStudyInputSection(context),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CollectionNavigationBar(onPressedNext: () {
        if (_formKey.currentState!.validate()) {
          context.read<DataCollectionCubit>().nextStep();
        }
      }, onPressedBack: () {
        _formKey.currentState!.save();
        context.read<DataCollectionCubit>().previousStep();
      }),
    );
  }

  Widget _buildLineOfStudyInputSection(BuildContext context) {
    return SizedBox(
        child: FutureBuilder<List<LineOfStudyEntity>>(
      future: context.read<DataCollectionCubit>().linesOfStudy,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionDropdown<LineOfStudyEntity>(
            label: "Linha de Estudo",
            required: true,
            hintText: "Selecione",
            value: context.read<DataCollectionCubit>().state.lineOfStudy,
            items: snapshot.data!.map<DropdownMenuItem<LineOfStudyEntity>>(
                (LineOfStudyEntity value) {
              return DropdownMenuItem<LineOfStudyEntity>(
                value: value,
                child: Text(
                  value.name,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<DataCollectionCubit>().setLineOfStudy(value);
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }
}
