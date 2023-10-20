import 'package:ghazaoman/pages/asli.dart';
import 'package:ghazaoman/pages/home_screen.dart';

class AppRout {
  static final pages = {
    '/': (context) => const HomeScreen(),
    '/asli': (context) => const Asli(),
  };
}
