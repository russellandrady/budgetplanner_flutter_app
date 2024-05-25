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
          primaryColor: Color(0xFFA3A6CC),
          primaryColorLight: Color(0xFFEEF36A),
          primaryColorDark: Color(0xFF7D82B8)),
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/budgets': (context) => Budgets()
      },
    );
  }
}
