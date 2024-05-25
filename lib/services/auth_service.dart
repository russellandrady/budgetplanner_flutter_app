import 'package:budgetplanner/pages/budgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Future<void> signup({required String email, required String password, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await Future.delayed(const Duration(seconds: 1));
      
      Navigator.pushNamed(context, '/budgets');
          
    } on FirebaseAuthException catch (e) {
      String message = 'Check the fields again';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Try again",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14,
      );
    }
  }
  Future<void> signin({required String email, required String password, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await Future.delayed(const Duration(seconds: 1));
      
      Navigator.pushNamed(context, '/budgets');
          
    } on FirebaseAuthException catch (e) {
      String message = 'Check the fields again';
      if (e.code == 'wrong-password') {
        message = 'Wrong credentials';
      } else if (e.code == 'user-not-found') {
        message = 'No user for the email.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Try again",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14,
      );
    }
  }
  Future<void> signout({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, '/login');
      Fluttertoast.showToast(
        msg: "Successfully signed out",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14,
      ); 
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "error",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14,
      );
    }
  }
}
