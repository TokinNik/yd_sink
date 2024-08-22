import 'package:flutter/material.dart';

import 'core.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _SFProDisplayFontFamily = "SFProDisplay";

  // Bold

  static TextStyle s11bold = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w700,
    fontSize: 11,
  );

  static TextStyle s10bold = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w700,
    fontSize: 10,
  );

  static TextStyle s14bold = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  // Semibold

  static TextStyle s22semibold = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  static TextStyle s20semibold = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static TextStyle s17semibold = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w600,
    fontSize: 17,
  );

  static TextStyle s16semibold = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle s14semibold = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  // Medium

  static TextStyle s12medium = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static TextStyle s13medium = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );

  static TextStyle s14medium = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle s16medium = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  // Regular

  static TextStyle s22regular = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w300,
    fontSize: 22,
  );

  static TextStyle s17regular = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  static TextStyle s14regular = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle s13regular = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );

  static TextStyle s12regular = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static TextStyle s11regular = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w400,
    fontSize: 11,
  );

  static TextStyle s10regular = const TextStyle(
    fontFamily: _SFProDisplayFontFamily,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
}

extension TextStylesExt on TextStyle {
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get white => copyWith(color: AppColors.white);

}
