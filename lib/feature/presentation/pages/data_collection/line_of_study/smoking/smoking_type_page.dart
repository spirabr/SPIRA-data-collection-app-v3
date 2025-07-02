import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spira/feature/core/app_colors.dart';
import 'package:spira/feature/domain/entities/smoking_entity.dart';
import 'package:spira/feature/presentation/cubits/data_collection/data_collection_cubit.dart';
import 'package:spira/feature/presentation/widgets/collection_dropdown.dart';
import 'package:spira/feature/presentation/pages/data_collection/widgets/collection_navigation_bar.dart';

// ignore: must_be_immutable
class SmokingTypePage extends StatelessWidget {
  SmokingTypePage({super.key});

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
                "Tipo de cigarro",
                style: TextStyle(
                  color: AppColors.neutral800,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              _buildSmokingTypeInputSection(context),
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

  Widget _buildSmokingTypeInputSection(BuildContext context) {
    return SizedBox(
        child: FutureBuilder<List<SmokingEntity>>(
      future: context.read<DataCollectionCubit>().smokingTypes,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CollectionDropdown<SmokingEntity>(
            label: "Tipo",
            required: true,
            hintText: "Selecione",
            value: context.read<DataCollectionCubit>().state.smokingType,
            items: snapshot.data!
                .map<DropdownMenuItem<SmokingEntity>>((SmokingEntity value) {
              return DropdownMenuItem<SmokingEntity>(
                value: value,
                child: Text(
                  value.name,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<DataCollectionCubit>().setSmokingType(value);
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
