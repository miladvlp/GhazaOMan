import 'package:flutter/material.dart';

class AllProvider extends ChangeNotifier {
  late bool theme = true;

  void them(bool value) {
    theme = value;
  }
}
