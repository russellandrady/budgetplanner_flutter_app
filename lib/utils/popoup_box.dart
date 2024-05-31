import 'package:budgetplanner/utils/buttons_regular.dart';
import 'package:budgetplanner/utils/textfields_regular.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopoupBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final budgetName;
  // ignore: prefer_typing_uninitialized_variables
  final budgetAmount;
  // ignore: prefer_typing_uninitialized_variables
  final loading;
  VoidCallback onSave;
  PopoupBox(
      {super.key,
      required this.onSave,
      required this.budgetName,
      required this.budgetAmount,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 220,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextfieldsRegular(
                  fieldController: budgetName,
                  textHint: "Task",
                  fieldColor: Colors.black,
                  hideText: false),
              TextfieldsRegular(
                  fieldController: budgetAmount,
                  textHint: "Budget",
                  fieldColor: Colors.black,
                  hideText: false),
              ButtonsRegular(
                name: 'ADD',
                onSave: onSave,
                buttonColor: Theme.of(context).primaryColorDark,
                loading: loading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
