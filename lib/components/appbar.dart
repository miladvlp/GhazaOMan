import 'package:flutter/material.dart';
import 'package:ghazaoman/style/app_colors.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  List<Widget>? action;
  Widget? leading;
  MyAppbar({super.key, required this.title, this.action, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appbar,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      actions: action,
      elevation: 1,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
