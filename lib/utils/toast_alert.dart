import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastAlert {
  Future<void> toastAlert({required String message}) {
    Fluttertoast.cancel();
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14,
    );
  }
}
