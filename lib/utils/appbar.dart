import 'package:budgetplanner/services/auth_service.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLogoutuButton;
  const CustomAppbar({super.key, required this.showLogoutuButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: IconThemeData(color: Theme.of(context).highlightColor),
      title: const Center(),
      actions: showLogoutuButton
          ? [
              IconButton(
                  onPressed: () async {
                    await AuthService().signout(context: context);
                  },
                  icon: const Icon(Icons.logout))
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
