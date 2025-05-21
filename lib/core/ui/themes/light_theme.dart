import 'dart:ui';

import 'package:flutter/material.dart';

import 'theme.dart';

class ColorsLight {
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray15 = Color(0xFFF5F5F5);
  static const Color gray30 = Color(0xFFDCDCDC);
  static const Color gray70 = Color(0xFF788C9F);
  static const Color gray80 = Color(0xFF51606D);
  static const Color gray90 = Color(0xFF0E2336);
  static const Color black100 = Color(0xFF000000);
  static const Color black65 = Color(0xA6000000);
  static const Color black40 = Color(0x73000000);
  static const Color accent120 = Color(0xFF36638D);
  static const Color accent100 = Color(0xFF0074E0);
  static const Color accent60 = Color(0xFF61B3FF);
  static const Color accent30 = Color(0xFFE8F4FF);
  static const Color green100 = Color(0xFF009907);
  static const Color green140 = Color(0xFF4D594E);
  static const Color yellow100 = Color(0xFFFFD600);
  static const Color red100 = Color(0xFFDA3939);
  static const Color red50 = Color(0xFFFC9999);
  static const Color red30 = Color(0xFFFFEDED);
}

const customLightTheme = CustomTheme(
  strokeInvert: ColorsLight.white,
  strokePrimary: ColorsLight.gray15,
  strokeSecondary: ColorsLight.gray30,
  strokeAccentPrimary: ColorsLight.accent100,
  backgroundPrimary: ColorsLight.white,
  backgroundSecondary: ColorsLight.gray15,
  backgroundTetriary: ColorsLight.gray30,
  backgroundAccentPrimary: ColorsLight.accent100,
  backgroundAccentSecondary: ColorsLight.accent60,
  backgroundAccentInvert: ColorsLight.accent30,
  backgroundPositive: ColorsLight.green100,
  backgroundNegativePrimary: ColorsLight.red100,
  backgroundNegativeSecondary: ColorsLight.red50,
  backgroundNegativeInvert: ColorsLight.red30,
  backgroundInvertTransparent: ColorsLight.black65,
  backgroundInvertModal: ColorsLight.black40,
  contentInvertPrimary: ColorsLight.white,
  contentInvertSecondary: ColorsLight.gray30,
  contentTetriary: ColorsLight.gray70,
  contentSecondary: ColorsLight.gray80,
  contentPrimary: ColorsLight.gray90,
  contentAccentPrimary: ColorsLight.accent100,
  contentAccentSecondary: ColorsLight.accent60,
  contentAccentTetriary: ColorsLight.accent30,
  contentNegative: ColorsLight.red100,
  contentPositivePrimary: ColorsLight.green100,
  contentPositiveSecondary: ColorsLight.green140,
  contentRate: ColorsLight.yellow100,
);
