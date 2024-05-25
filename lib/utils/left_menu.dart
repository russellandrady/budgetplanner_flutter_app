import 'package:flutter/material.dart';

class LeftMenu extends StatelessWidget implements PreferredSizeWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
