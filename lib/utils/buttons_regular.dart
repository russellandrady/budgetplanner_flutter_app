
import 'package:flutter/material.dart';


class ButtonsRegular extends StatelessWidget {
  final VoidCallback onSave;
  final String name;
  final Color buttonColor;
  final bool loading;
  const ButtonsRegular(
      {super.key,
      required this.name,
      required this.onSave,
      required this.buttonColor,
      required this.loading});

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
              side: const BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(15)),
          child: !loading
              ? Text(
                  name,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )
              : const SizedBox(
                  width: 20, // Adjust width as needed
                  height: 20, // Adjust height as needed
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                  ),
                ),
        ),
      ),
    );
  }
}
