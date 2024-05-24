import 'package:budgetplanner/pages/login.dart';
import 'package:budgetplanner/pages/register.dart';
import 'package:budgetplanner/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      theme: ThemeData(
          primaryColor: Color(0xFFA3A6CC),
          primaryColorLight: Color(0xFFEEF36A),
          primaryColorDark: Color(0xFF7D82B8)),
      routes: {'/login': (context) => Login(),'/register':(context)=>Register()},
    );
  }
}
