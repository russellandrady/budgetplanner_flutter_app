import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).primaryColorLight,
      content: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: budgetName,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Ex: To by a car",
              ),
            ),
            TextField(
              controller: budgetAmount,
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: "Ex: 50"),
            ),
            MaterialButton(
              onPressed: onSave,
              color: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Add",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
