import 'package:flutter/material.dart';

class AppTheme {
  // Main colors from design chart
  static const Color primaryBlue = Color(0xFF2F70AF);
  static const Color secondaryPink = Color(0xFFB9848C);
  static const Color tertiaryPurple = Color(0xFF806491);

  // Create material color swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF2F70AF,
    <int, Color>{
      50: Color(0xFFE6EEF6),
      100: Color(0xFFBFD5E9),
      200: Color(0xFF95B9DB),
      300: Color(0xFF6A9CCD),
      400: Color(0xFF4A86C2),
      500: Color(0xFF2F70AF),
      600: Color(0xFF2A68A8),
      700: Color(0xFF235D9F),
      800: Color(0xFF1D5396),
      900: Color(0xFF124185),
    },
  );

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: primarySwatch,
      primaryColor: primaryBlue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: secondaryPink,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'FiraSans',
          color: primaryBlue,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'FiraSans',
          color: primaryBlue,
        ),
        titleLarge: TextStyle(
          fontFamily: 'FiraSans',
          color: tertiaryPurple,
        ),
        titleMedium: TextStyle(
          fontFamily: 'FiraSans',
          color: tertiaryPurple,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Numans',
          color: Colors.black87,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Numans',
          color: Colors.black87,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: secondaryPink.withOpacity(0.1),
        labelStyle: const TextStyle(color: secondaryPink),
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}