import 'package:budgetplanner/services/auth_service.dart';
import 'package:budgetplanner/utils/appbar.dart';
import 'package:budgetplanner/utils/buttons_regular.dart';
import 'package:budgetplanner/utils/left_menu.dart';
import 'package:budgetplanner/utils/textfields_regular.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool loading = false;

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
                    "USER REGISTER",
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
                  fieldColor: Theme.of(context).highlightColor,
                  hideText: false,
                ),
                TextfieldsRegular(
                  fieldController: _passwordController,
                  textHint: "Password",
                  fieldColor: Theme.of(context).highlightColor,
                  hideText: true,
                ),
                ButtonsRegular(
                  name: "REGISTER",
                  onSave: () async {
                    setState(() {
                      loading = true;
                    });
                    await AuthService().signup(
                        context: context,
                        email: _emailController.text,
                        password: _passwordController.text);
                    setState(() {
                      loading = false;
                    });
                  },
                  buttonColor: Theme.of(context).highlightColor,
                  loading: loading,
                ),
                InkWell(
                  child: const Text(
                    'Login here',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
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
