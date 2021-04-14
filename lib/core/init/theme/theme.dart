import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.LIGHT_THEME: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black),
      ),
    ),
    AppTheme.DARK_THEME: ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.teal,
      backgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
    ),
  };
}

enum AppTheme {
  LIGHT_THEME,
  DARK_THEME,
}
