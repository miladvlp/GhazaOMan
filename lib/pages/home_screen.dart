import 'package:flutter/material.dart';
import 'package:ghazaoman/components/appbar.dart';
import 'package:ghazaoman/components/baner_home_screen.dart';
import 'package:ghazaoman/components/drawer.dart';
import 'package:ghazaoman/components/drawer_icon.dart';
import 'package:ghazaoman/model/menue.dart';
import 'package:ghazaoman/pages/detail.dart';
import 'package:ghazaoman/style/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _menuelist = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addMenueList();
    });
  }

  void _addMenueList() {
    List<Menue> _menus = [
      Menue(
          image: "assets/images/menue/sonati.jpg",
          title: "غذاهای اصلی",
          detail: ["assets/images/menue/1.jpg"]),
      Menue(
          image: "assets/images/menue/fasttfood.jpg",
          title: "فست فود",
          detail: ["assets/images/menue/2.jpg"]),
      Menue(
          image: "assets/images/menue/pishGhaza.jpg",
          title: "پیش غذا",
          detail: ["assets/images/menue/3.jpg"]),
      Menue(
          image: "assets/images/menue/deser.jpg",
          title: "شیرینی و دسر",
          detail: ["assets/images/menue/4.jpg"]),
      Menue(
          image: "assets/images/menue/sobhane.jpg",
          title: "صبحانه",
          detail: ["assets/images/menue/5.png"]),
      Menue(
          image: "assets/images/menue/other.jpg",
          title: "سایر",
          detail: ["assets/images/menue/6.jpg"])
    ];

    Future ft = Future(() {});
    _menus.forEach((Menue menue) {
      ft = ft.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _menuelist.add(_buildTile(menue));
          _listKey.currentState!.insertItem(_menuelist.length - 1);
        });
      });
    });
  }

  Widget _buildTile(Menue menue) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(menue: menue)));
      },
      contentPadding: const EdgeInsets.all(2),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 125,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Hero(
                    tag: menue.image,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(menue.image),
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Center(
                      child: Text(
                    menue.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
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
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const BanerHomeScreen(),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _menuelist.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(_offset),
                    child: _menuelist[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
