import 'package:budgetplanner/services/auth_service.dart';
import 'package:budgetplanner/utils/appbar.dart';
import 'package:budgetplanner/utils/left_menu.dart';
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 9,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Email"),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                ),
                MaterialButton(
                  onPressed: () async {
                    await AuthService().signin(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                  },
                  color: Theme.of(context).primaryColorDark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                InkWell(
                  child: const Text(
                    'Register here',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
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
