import 'package:budgetplanner/services/auth_service.dart';
import 'package:budgetplanner/utils/appbar.dart';
import 'package:budgetplanner/utils/buttons_regular.dart';
import 'package:budgetplanner/utils/left_menu.dart';
import 'package:budgetplanner/utils/textfields_regular.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(showLogoutuButton: false),
      drawer: LeftMenu(),
      body: Center(
        child: Container(
          height: 400.0,
          width: 400.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.4),
            //     spreadRadius: 3,
            //     blurRadius: 9,
            //     offset: Offset(0, 3),
            //   ),
            // ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "USER LOGIN",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white),
                  ),
                ),
                TextfieldsRegular(
                    fieldController: _emailController,
                    textHint: "Email",
                    fieldColor: Theme.of(context).highlightColor),
                TextfieldsRegular(
                    fieldController: _passwordController,
                    textHint: "Password",
                    fieldColor: Theme.of(context).highlightColor),
                ButtonsRegular(
                  name: "LOGIN",
                  onSave: () async {
                    await AuthService().signin(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                  },
                  buttonColor: Theme.of(context).highlightColor,
                ),
                InkWell(
                  child: const Text(
                    'Register here',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
