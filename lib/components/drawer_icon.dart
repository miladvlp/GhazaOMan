import 'package:flutter/material.dart';
import 'package:ghazaoman/style/app_colors.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu_rounded,
          color: AppColors.white,
        ));
  }
}
