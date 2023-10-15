import 'package:flutter/material.dart';
import 'package:ghazaoman/components/appbar.dart';
import 'package:ghazaoman/components/drawer.dart';
import 'package:ghazaoman/style/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppbar(title: "غذا و من", leading: const Menue()),
        drawer: MyDrawer(),
      ),
    );
  }
}

class Menue extends StatelessWidget {
  const Menue({super.key});

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
