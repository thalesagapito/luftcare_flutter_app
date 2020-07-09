import 'package:flutter/material.dart';

class ThemeColors {
  // hides constructor and prevents class from being instantiated
  ThemeColors._();

  static const Color avocado = Color(0xFF3AAFA2);
  static const Color info = Color(0xFFA8D5E2);
  static const Color danger = Color(0xFFFE6364);
  static const Color warning = Color(0xFFFFBA49);
  static const Color success = Color(0xFF60D394);

  static const MaterialColor gray = MaterialColor(
    _primaryGray,
    <int, Color>{
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFFE0E0E0),
      400: Color(0xFFBDBDBD),
      500: Color(_primaryGray),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF424242),
      900: Color(0xFF202020),
    },
  );
  static const int _primaryGray = 0xFF9E9E9E;

  static const MaterialColor red = MaterialColor(
    _primaryRed,
    <int, Color>{
      100: Color(0xFFFFF5F5),
      200: Color(0xFFFED7D7),
      300: Color(0xFFFEB2B2),
      400: Color(0xFFFC8181),
      500: Color(_primaryRed),
      600: Color(0xFFE53E3E),
      700: Color(0xFFC53030),
      800: Color(0xFF9B2C2C),
      900: Color(0xFF742A2A),
    },
  );
  static const int _primaryRed = 0xFFF56565;

  static const MaterialColor orange = MaterialColor(
    _primaryOrange,
    <int, Color>{
      100: Color(0xFFFFFAF0),
      200: Color(0xFFFEEBC8),
      300: Color(0xFFFBD38D),
      400: Color(0xFFF6AD55),
      500: Color(_primaryOrange),
      600: Color(0xFFDD6B20),
      700: Color(0xFFC05621),
      800: Color(0xFF9C4221),
      900: Color(0xFF7B341E),
    },
  );
  static const int _primaryOrange = 0xFFED8936;

  static const MaterialColor yellow = MaterialColor(
    _primaryYellow,
    <int, Color>{
      100: Color(0xFFFFFFF0),
      200: Color(0xFFFEFCBF),
      300: Color(0xFFFAF089),
      400: Color(0xFFF6E05E),
      500: Color(_primaryYellow),
      600: Color(0xFFD69E2E),
      700: Color(0xFFB7791F),
      800: Color(0xFF975A16),
      900: Color(0xFF744210),
    },
  );
  static const int _primaryYellow = 0xFFECC94B;

  static const MaterialColor green = MaterialColor(
    _primaryGreen,
    <int, Color>{
      100: Color(0xFFF0FFF4),
      200: Color(0xFFC6F6D5),
      300: Color(0xFF9AE6B4),
      400: Color(0xFF68D391),
      500: Color(_primaryGreen),
      600: Color(0xFF38A169),
      700: Color(0xFF2F855A),
      800: Color(0xFF276749),
      900: Color(0xFF22543D),
    },
  );
  static const int _primaryGreen = 0xFF48BB78;

  static const MaterialColor teal = MaterialColor(
    _primaryTeal,
    <int, Color>{
      100: Color(0xFFE6FFFA),
      200: Color(0xFFB2F5EA),
      300: Color(0xFF81E6D9),
      400: Color(0xFF4FD1C5),
      500: Color(_primaryTeal),
      600: Color(0xFF319795),
      700: Color(0xFF2C7A7B),
      800: Color(0xFF285E61),
      900: Color(0xFF234E52),
    },
  );
  static const int _primaryTeal = 0xFF38B2AC;

  static const MaterialColor blue = MaterialColor(
    _primaryBlue,
    <int, Color>{
      100: Color(0xFFEBF8FF),
      200: Color(0xFFBEE3F8),
      300: Color(0xFF90CDF4),
      400: Color(0xFF63B3ED),
      500: Color(_primaryBlue),
      600: Color(0xFF3182CE),
      700: Color(0xFF2B6CB0),
      800: Color(0xFF2C5282),
      900: Color(0xFF2A4365),
    },
  );
  static const int _primaryBlue = 0xFF4299E1;

  static const MaterialColor indigo = MaterialColor(
    _primaryIndigo,
    <int, Color>{
      100: Color(0xFFEBF4FF),
      200: Color(0xFFC3DAFE),
      300: Color(0xFFA3BFFA),
      400: Color(0xFF7F9CF5),
      500: Color(_primaryIndigo),
      600: Color(0xFF5A67D8),
      700: Color(0xFF4C51BF),
      800: Color(0xFF434190),
      900: Color(0xFF3C366B),
    },
  );
  static const int _primaryIndigo = 0xFF667EEA;

  static const MaterialColor purple = MaterialColor(
    _primaryPurple,
    <int, Color>{
      100: Color(0xFFFAF5FF),
      200: Color(0xFFE9D8FD),
      300: Color(0xFFD6BCFA),
      400: Color(0xFFB794F4),
      500: Color(_primaryPurple),
      600: Color(0xFF805AD5),
      700: Color(0xFF6B46C1),
      800: Color(0xFF553C9A),
      900: Color(0xFF44337A),
    },
  );
  static const int _primaryPurple = 0xFF9F7AEA;

  static const MaterialColor pink = MaterialColor(
    _primaryPink,
    <int, Color>{
      100: Color(0xFFFFF5F7),
      200: Color(0xFFFED7E2),
      300: Color(0xFFFBB6CE),
      400: Color(0xFFF687B3),
      500: Color(_primaryPink),
      600: Color(0xFFD53F8C),
      700: Color(0xFFB83280),
      800: Color(0xFF97266D),
      900: Color(0xFF702459),
    },
  );
  static const int _primaryPink = 0xFFED64A6;
}
