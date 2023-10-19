import 'package:flutter/material.dart';
import 'package:ghazaoman/style/app_colors.dart';

class BanerHomeScreen extends StatelessWidget {
  const BanerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        builder: (BuildContext context, double _val, child) {
          return Opacity(
            opacity: _val,
            child: Padding(
              padding: EdgeInsets.only(top: _val * 20),
              child: child,
            ),
          );
        },
        child: const Text(
          "دسته بندی غذا ها",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.white,
              fontSize: 17),
        ),
      ),
    );
  }
}
