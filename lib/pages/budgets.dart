import 'package:budgetplanner/utils/appbar.dart';
import 'package:budgetplanner/utils/left_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Budgets extends StatelessWidget {
  const Budgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(showLogoutuButton: true,),
      drawer: LeftMenu(),
      body: Center(
          child: Text(
              "Hello " + FirebaseAuth.instance.currentUser!.email!.toString())),
    );
  }
}
