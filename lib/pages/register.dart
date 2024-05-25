import 'package:budgetplanner/services/auth_service.dart';
import 'package:budgetplanner/utils/appbar.dart';
import 'package:budgetplanner/utils/left_menu.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Register({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showLogoutuButton: false,
      ),
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Register",
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
                    await AuthService().signup(
                        context: context,
                        email: _emailController.text,
                        password: _passwordController.text);
                  },
                  color: Theme.of(context).primaryColorDark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                InkWell(
                  child: const Text(
                    'Login here',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
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
