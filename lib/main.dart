import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghazaoman/config/app_rout.dart';
import 'package:ghazaoman/model/provider.dart';
import 'package:ghazaoman/pages/home_screen.dart';
import 'package:ghazaoman/style/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AllProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Sans",
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.bg),
      initialRoute: '/',
      routes: AppRout.pages,
    );
  }
}
