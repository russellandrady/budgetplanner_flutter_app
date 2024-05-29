import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonsRegular extends StatelessWidget {
  final VoidCallback onSave;
  final String name;
  final Color buttonColor;
  ButtonsRegular({super.key, required this.name, required this.onSave, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: 180,
        child: MaterialButton(
          onPressed: onSave,
          color: buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
