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
            ),)
          ],
        ),
      ),
      body: Container(
        child: Text("hello"),
      ),
    );
  }
}
