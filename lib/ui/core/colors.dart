import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color black = Color(0xFF000000);
  static Color black80 = const Color(0xFF000000).withOpacity(0.80);
  static Color black05 = const Color(0xFF000000).withOpacity(0.05);
  static const Color white = Color(0xFFFFFFFF);
  static Color white75 = const Color(0xFFFFFFFF).withOpacity(0.75);
  static const Color transparent = Color(0x00FFFFFF);

  //Main colors
  static const Color blueMain = Color(0x001199DD);
  static const Color redMain = Color(0xFFDD1111);
  static const Color greenMain = Color(0xFF44DD11);
  static const Color grayMain = Color(0xFFCECECE);

  // Text
  static const Color textBlack = Color(0xFF303133);

  //Gradient
  static LinearGradient whiteGradient = LinearGradient(
    colors: [
      white,
      white.withOpacity(0.8),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient blackGradient = LinearGradient(
    colors: [
      transparent,
      black80,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
