import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Center(
          child: Text(
            "B u d g e t  P l a n n e r",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: const Column(
          children: [
            DrawerHeader(
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      ),
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
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Username"),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Email"),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColorDark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
