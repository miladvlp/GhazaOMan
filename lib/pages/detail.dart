import 'package:flutter/material.dart';
import 'package:ghazaoman/components/appbar.dart';
import 'package:ghazaoman/components/drawer.dart';
import 'package:ghazaoman/components/drawer_icon.dart';
import 'package:ghazaoman/model/menue.dart';
import 'package:ghazaoman/style/app_colors.dart';

class Details extends StatelessWidget {
  final Menue menue;
  const Details({super.key, required this.menue});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppbar(
          title: menue.title,
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
          leading: const DrawerIcon(),
        ),
        drawer: const MyDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: Hero(
                  tag: menue.image,
                  child: Image.asset(
                    menue.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: menue.detail.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Image.asset(menue.detail[index]),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
