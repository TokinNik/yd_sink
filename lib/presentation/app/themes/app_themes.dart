import 'package:flutter/material.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  AppTheme._();

  static bool useMaterial3 = false;

  static ThemeData lightTheme = ThemeData.light(useMaterial3: useMaterial3)
      .copyWith(extensions: <ThemeExtension<dynamic>>[customLightTheme]);

  static ThemeData dartTheme = ThemeData.dark(useMaterial3: useMaterial3)
      .copyWith(extensions: <ThemeExtension<dynamic>>[customDarkTheme]);
}
