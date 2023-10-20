import 'package:flutter/material.dart';

class Menue {
  final String title;
  final String image;
  final VoidCallback ontap;
  late List<String> detail = [];
  late List<String> titledetail = [];
  Menue(this.ontap,
      {required this.image,
      required this.title,
      required this.detail,
      required this.titledetail});
}
