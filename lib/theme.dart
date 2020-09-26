import 'package:flutter/material.dart';

class AppTheme {
  static const _lapis = Color(0xFF5C6AC4);
  static const _avocado = Color(0xFF3AAFA2);
  static const _coral = Color(0xFFFE6364);

  static final _buttonTheme = ButtonThemeData(
    buttonColor: _lapis,
    textTheme: ButtonTextTheme.primary,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    primaryColor: _lapis,
    // accentColor: _avocado,
    accentColor: Colors.redAccent[100],
    // highlightColor: Color(0xFF895CC4),
    errorColor: _coral,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      // descending font size
      headline1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      subtitle1: TextStyle(),
      subtitle2: TextStyle(),
      button: TextStyle(),
      overline: TextStyle(),
      caption: TextStyle(),
    ),
    buttonTheme: _buttonTheme,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    primaryColor: _lapis,
    accentColor: _avocado,
    // highlightColor: Color(0xFF895CC4),
    errorColor: _coral,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: _buttonTheme,
  );
}
