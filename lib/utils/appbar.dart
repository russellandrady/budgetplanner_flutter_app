import 'package:budgetplanner/services/auth_service.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColorDark,
      title: const Center(),
      actions: [
        IconButton(
            onPressed: () async {
              await AuthService().signout(context: context);
            },
            icon: Icon(Icons.logout))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
