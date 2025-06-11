import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF2D70F2),
  scaffoldBackgroundColor: const Color(0xFF121212),
  fontFamily: 'Inter',
  cardColor: const Color(0xFF1E1E1E),
  iconTheme: const IconThemeData(color: Color(0xFF4CC0E0)),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 65,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: Color(0xFF4CC0E0),
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      color: Color(0xFFE0E0E0),
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: Color(0xFFAAAAAA),
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF2D70F2),
    secondary: Color(0xFF4CC0E0),
    surface: Color(0xFF1E1E1E),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    error: Colors.redAccent,
    onError: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2D70F2),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF4CC0E0),
    unselectedItemColor: Color(0xFF888888),
    backgroundColor: Color(0xFF121212),
    elevation: 12,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
  ),
);
