import 'package:budgetplanner/pages/login.dart';
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
          primaryColor: Color(0xFFFFA686),
          primaryColorLight: Color(0xFFFEC196),
          primaryColorDark: Color(0xFFD6A184)),
      routes: {'/login': (context) => Login()},
    );
  }
}
