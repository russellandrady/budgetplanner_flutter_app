import 'package:budgetplanner/services/auth_service.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLogoutuButton;
  const CustomAppbar({super.key, required this.showLogoutuButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Center(),
      actions: showLogoutuButton
          ? [
              IconButton(
                  onPressed: () async {
                    await AuthService().signout(context: context);
                  },
                  icon: Icon(Icons.logout))
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
