import 'package:budgetplanner/utils/buttons_regular.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopoupBox extends StatelessWidget {
  final budgetName;
  final budgetAmount;
  VoidCallback onSave;
  PopoupBox(
      {super.key,
      required this.onSave,
      required this.budgetName,
      required this.budgetAmount});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 220,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: budgetName,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Ex: To By a Car",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                  borderSide: BorderSide(
                    // Change to your desired border color
                    width: 2.0, // Change to your desired border width
                  ),
                ),
              ),
            ),
            TextField(
              controller: budgetAmount,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Ex: 50",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                  borderSide: BorderSide(
                    // Change to your desired border color
                    width: 2.0, // Change to your desired border width
                  ),
                ),
              ),
            ),
            ButtonsRegular(
              name: 'ADD NEW TASK',
              onSave: onSave,
              buttonColor: Theme.of(context).primaryColorDark,
            )
          ],
        ),
      ),
    );
  }
}
