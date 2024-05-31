
import 'package:flutter/material.dart';

class TextfieldsRegular extends StatelessWidget {
  final fieldController;
  final String textHint;
  final Color fieldColor;
  final bool hideText;
  const TextfieldsRegular(
      {super.key,
      required this.fieldController,
      required this.textHint,
      required this.fieldColor,
      required this.hideText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      textAlign: TextAlign.center,
      obscureText: hideText,
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
