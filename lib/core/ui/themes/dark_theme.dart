import 'dart:ui';

import 'theme.dart';

class ColorsDark {
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray15 = Color(0xFF222222);
  static const Color gray30 = Color(0xFF484848);
  static const Color gray70 = Color(0xFF8D9CA9);
  static const Color gray80 = Color(0xFFD5E1EC);
  static const Color gray90 = Color(0xFFFAFCFF);
  static const Color trueBlack100_100 = Color(0xFF000000);
  static const Color trueBlack65_100 = Color(0xA6000000);
  static const Color trueBlack40_100 = Color(0x73000000);
  static const Color accent120 = Color(0xFF36638D);
  static const Color accent100 = Color(0xFF40A3FF);
  static const Color accent60 = Color(0xFF61B3FF);
  static const Color accent30 = Color(0xFF1D2D3C);
  static const Color green100 = Color(0xFF009907);
  static const Color green140 = Color(0xFF4D594E);
  static const Color yellow100 = Color(0xFFFFD600);
  static const Color red100 = Color(0xFFFE4D4D);
  static const Color red50 = Color(0xFFFC9999);
  static const Color red30 = Color(0xFF412525);
  static const Color magicNumber = Color(0XFF1A1A1A);
}

const customDarkTheme = CustomTheme(
  strokeInvert: ColorsDark.white,
  strokePrimary: ColorsDark.gray15,
  strokeSecondary: ColorsDark.gray30,
  strokeAccentPrimary: ColorsDark.accent100,
  backgroundPrimary: ColorsDark.magicNumber,
  backgroundSecondary: ColorsDark.gray15,
  backgroundTetriary: ColorsDark.gray30,
  backgroundAccentPrimary: ColorsDark.accent100,
  backgroundAccentSecondary: ColorsDark.accent60,
  backgroundAccentInvert: ColorsDark.accent30,
  backgroundPositive: ColorsDark.green100,
  backgroundNegativePrimary: ColorsDark.red100,
  backgroundNegativeSecondary: ColorsDark.red50,
  backgroundNegativeInvert: ColorsDark.red30,
  backgroundInvertTransparent: ColorsDark.trueBlack65_100,
  backgroundInvertModal: ColorsDark.trueBlack40_100,
  contentInvertPrimary: ColorsDark.white,
  contentInvertSecondary: ColorsDark.gray30,
  contentTetriary: ColorsDark.gray70,
  contentSecondary: ColorsDark.gray80,
  contentPrimary: ColorsDark.gray90,
  contentAccentPrimary: ColorsDark.accent100,
  contentAccentSecondary: ColorsDark.accent60,
  contentAccentTetriary: ColorsDark.accent30,
  contentNegative: ColorsDark.red100,
  contentPositivePrimary: ColorsDark.green100,
  contentPositiveSecondary: ColorsDark.green140,
  contentRate: ColorsDark.yellow100,
);
