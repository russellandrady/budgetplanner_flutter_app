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
      content: Container(
        height: 180,
        width: 300,
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MaterialButton(
                onPressed: onSave,
                color: Theme.of(context).primaryColorLight,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "ADD",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
