import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, '/login');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
          child: Text(
        "Budget Planner",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      )),
    );
  }
}
