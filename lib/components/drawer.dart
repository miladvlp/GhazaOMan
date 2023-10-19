import 'package:flutter/material.dart';
import 'package:ghazaoman/model/provider.dart';
import 'package:ghazaoman/style/app_colors.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AllProvider>(context).theme;
    return Drawer(
      elevation: 1,
      backgroundColor: AppColors.bg,
      shadowColor: AppColors.white,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.appbar),
            child: Image.asset("assets/images/icon/salad_325559.png", scale: 3),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                theme ? "حالت روز" : "حالت شب",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.white),
              ),
              Switch(
                value: light,
                activeColor: AppColors.red,
                onChanged: (bool value) {
                  setState(() {
                    light = value;
                    Provider.of<AllProvider>(context, listen: false)
                        .them(value);
                  });
                },
              )
            ],
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MiladValipor",
                style: TextStyle(color: AppColors.white),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.copyright_rounded,
                color: AppColors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
