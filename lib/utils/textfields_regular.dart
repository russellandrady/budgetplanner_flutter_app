import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextfieldsRegular extends StatelessWidget {
  final fieldController;
  final String textHint;
  final Color fieldColor;
  TextfieldsRegular({super.key, required this.fieldController, required this.textHint, required this.fieldColor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      textAlign: TextAlign.center,
      style: TextStyle(color: fieldColor),
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(color: fieldColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
          borderSide: BorderSide(width: 2.0, color: fieldColor),
        ),
      ),
    );
  }
}
