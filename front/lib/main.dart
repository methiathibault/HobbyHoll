import 'package:flutter/material.dart';
import 'package:front/app.menu/menu_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HOBBY HALL",
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: const MainMenuPage(),
    );
  }
}

