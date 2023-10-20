import 'package:flutter/material.dart';
import 'package:ghazaoman/components/appbar.dart';
import 'package:ghazaoman/components/drawer.dart';
import 'package:ghazaoman/components/drawer_icon.dart';
import 'package:ghazaoman/components/list_tile.dart';
import 'package:ghazaoman/model/menue.dart';
import 'package:ghazaoman/style/app_colors.dart';

class Asli extends StatefulWidget {
  const Asli({super.key});

  @override
  State<Asli> createState() => _AsliState();
}

class _AsliState extends State<Asli> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _menuelist = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addMenueList();
    });
  }

  Widget _buildTile(Menue menue) {
    return CustomListTile(
        menue: menue,
        ontap: menue.ontap,
        tag: menue.image,
        assetimage: menue.image,
        title: menue.title);
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppbar(
          title: "غذاهای اصلی",
          leading: const DrawerIcon(),
          action: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                ))
          ],
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5.5,
              child: Hero(
                tag: "1",
                child: Image.asset(
                  "assets/images/menue/sonati.jpg",
                  fit: BoxFit.cover,
                ),
              ),
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

  void _addMenueList() {
    List<Menue> _menus = [
      Menue(() {
        print("1");
      },
          image: "assets/images/Asli/abgosht.jpg",
          title: "آبگوشت و اشکنه",
          detail: [],
          titledetail: []),
      Menue(() {
        print("2");
      },
          image: "assets/images/Asli/dolme.jpg",
          title: "دلمه و کوفته",
          detail: [],
          titledetail: []),
      Menue(() {
        print("3");
      },
          image: "assets/images/Asli/khorak.jpg",
          title: "خوراک ها",
          detail: [],
          titledetail: []),
      Menue(() {
        print("4");
      },
          image: "assets/images/Asli/kabab.jpg",
          title: "کباب ها",
          detail: [],
          titledetail: []),
      Menue(() {
        print("5");
      },
          image: "assets/images/Asli/coco.jpg",
          title: "شامی، کوکو، کتلت",
          detail: [],
          titledetail: []),
      Menue(() {
        print("6");
      },
          image: "assets/images/Asli/sayerGhazaAsli.jpg",
          title: "سایر غذاهای اصلی",
          detail: [],
          titledetail: []),
      Menue(() {
        print("7");
      },
          image: "assets/images/Asli/polo.png",
          title: "پلوها و چلوها",
          detail: [],
          titledetail: []),
      Menue(() {
        print("8");
      },
          image: "assets/images/Asli/daryai.jpg",
          title: "غذاهای دریایی",
          detail: [],
          titledetail: []),
      Menue(() {
        print("9");
      },
          image: "assets/images/Asli/khoresht.jpg",
          title: "خورشت ها",
          detail: [],
          titledetail: []),
    ];
    Future ft = Future(() {});
    _menus.forEach((Menue menue) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _menuelist.add(_buildTile(menue));
          _listKey.currentState!.insertItem(_menuelist.length - 1);
        });
      });
    });
  }
}
