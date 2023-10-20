import 'package:flutter/material.dart';
import 'package:ghazaoman/components/appbar.dart';
import 'package:ghazaoman/components/baner_home_screen.dart';
import 'package:ghazaoman/components/drawer.dart';
import 'package:ghazaoman/components/drawer_icon.dart';
import 'package:ghazaoman/components/ithem_menue.dart';
import 'package:ghazaoman/pages/asli.dart';
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
        appBar: MyAppbar(
          title: "غذا و من",
          leading: const DrawerIcon(),
        ),
        drawer: const MyDrawer(),
        body: Column(children: [
          const SizedBox(
            height: 10,
          ),
          const BanerHomeScreen(),
          const SizedBox(
            height: 25,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.extent(
              maxCrossAxisExtent: 250,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                IthemMenue(
                  ontap: () {
                    Navigator.of(context).pushNamed('/asli');
                  },
                  text: "غذاهای اصلی",
                  image: "assets/images/menue/sonati.jpg",
                  duration: const Duration(milliseconds: 1000),
                  tag: "1",
                ),
                IthemMenue(
                  ontap: () {
                    print(2);
                  },
                  text: "فست فود",
                  image: "assets/images/menue/fasttfood.jpg",
                  duration: const Duration(milliseconds: 1000),
                  tag: "2",
                ),
                IthemMenue(
                  ontap: () {
                    print(3);
                  },
                  text: "مخلفات و پیش غذا",
                  image: "assets/images/menue/pishGhaza.jpg",
                  duration: const Duration(milliseconds: 1500),
                  tag: "3",
                ),
                IthemMenue(
                  ontap: () {
                    print(4);
                  },
                  text: "شیرینی و دسر",
                  image: "assets/images/menue/deser.jpg",
                  duration: const Duration(milliseconds: 1500),
                  tag: "4",
                ),
                IthemMenue(
                  ontap: () {
                    print(5);
                  },
                  text: "صبحانه",
                  image: "assets/images/menue/sobhane.jpg",
                  duration: const Duration(milliseconds: 2000),
                  tag: "5",
                ),
                IthemMenue(
                  ontap: () {
                    print(6);
                  },
                  text: "سایر",
                  image: "assets/images/menue/other.jpg",
                  duration: const Duration(milliseconds: 2000),
                  tag: "6",
                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
