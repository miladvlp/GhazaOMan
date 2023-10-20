import 'package:flutter/material.dart';
import 'package:ghazaoman/model/menue.dart';
import 'package:ghazaoman/style/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final Menue menue;
  final VoidCallback ontap;
  final Object tag;
  final String assetimage;
  final String title;
  const CustomListTile(
      {super.key,
      required this.menue,
      required this.ontap,
      required this.tag,
      required this.assetimage,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 2,
      onTap: ontap,
      contentPadding: const EdgeInsets.all(2),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Hero(
                    tag: tag,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(assetimage),
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Center(
                      child: Text(
                    title,
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
}
