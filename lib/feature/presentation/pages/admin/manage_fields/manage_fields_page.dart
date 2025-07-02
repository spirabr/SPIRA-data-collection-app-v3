import 'package:flutter/material.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/presentation/widgets/menu_button.dart';
import 'package:spira/feature/presentation/widgets/spira_app_bar.dart';

class ManageFieldsPage extends StatelessWidget {
  const ManageFieldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SpiraAppBar(
        title: "Gerenciar Campos",
        subtitle: "Selecione a categoria para\nalterar os campos",
        backButtonStyle: AppBarBackButtonStyle.backArrow,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
        children: [
          MenuButton(
              primaryText: "Geral",
              onPressed: () {
                Navigator.of(context).pushNamed(PageConst.manageGeneralFields);
              }),
          const SizedBox(height: 12.0),
          MenuButton(
              primaryText: "Insuficiência Respiratória",
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(PageConst.manageRespiratoryFailureFields);
              }),
          const SizedBox(height: 12.0),
          MenuButton(
              primaryText: "Tabagismo",
              onPressed: () {
                Navigator.of(context).pushNamed(PageConst.manageSmokingFields);
              }),
        ],
      ),
    );
  }
}
