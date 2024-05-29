import 'package:budgetplanner/firebase_options.dart';
import 'package:budgetplanner/pages/budgets.dart';
import 'package:budgetplanner/pages/login.dart';
import 'package:budgetplanner/pages/register.dart';
import 'package:budgetplanner/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          primaryColor: Color(0xFF04724D),
          primaryColorLight: Color(0xFFE7E7E7),
          primaryColorDark: Color(0xFFF2D0A9),
          highlightColor: Colors.white),
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/budgets': (context) => Budgets()
      },
    );
  }
}
