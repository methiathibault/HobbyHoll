import 'package:flutter/material.dart';
import 'package:front/app.theme/app_theme.dart';
import 'package:front/app.list/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOBBY HALL',
      theme: AppTheme.lightTheme,
      home: const SearchPage(),
    );
  }
}