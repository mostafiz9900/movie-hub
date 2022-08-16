import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ),
      cardColor: Colors.black,
      cardTheme: CardTheme(
        color: Colors.black,
      ));

  static ThemeData lightTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.light,
      primaryColor: Colors.blueGrey,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueGrey,
        disabledColor: Colors.blueGrey,
      ),
      cardColor: Colors.white,
      cardTheme: CardTheme(
        color: Colors.white,
      ));
}
