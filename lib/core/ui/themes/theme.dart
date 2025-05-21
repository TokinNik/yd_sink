// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// Не форматируй!

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme({
    required this.strokeInvert,
    required this.strokePrimary,
    required this.strokeSecondary,
    required this.strokeAccentPrimary,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTetriary,
    required this.backgroundAccentPrimary,
    required this.backgroundAccentSecondary,
    required this.backgroundAccentInvert,
    required this.backgroundPositive,
    required this.backgroundNegativePrimary,
    required this.backgroundNegativeSecondary,
    required this.backgroundNegativeInvert,
    required this.backgroundInvertTransparent,
    required this.backgroundInvertModal,
    required this.contentInvertPrimary,
    required this.contentInvertSecondary,
    required this.contentTetriary,
    required this.contentSecondary,
    required this.contentPrimary,
    required this.contentAccentPrimary,
    required this.contentAccentSecondary,
    required this.contentAccentTetriary,
    required this.contentNegative,
    required this.contentPositivePrimary,
    required this.contentPositiveSecondary,
    required this.contentRate,
  });

  final Color strokeInvert;
  final Color strokePrimary;
  final Color strokeSecondary;
  final Color strokeAccentPrimary;
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTetriary;
  final Color backgroundAccentPrimary;
  final Color backgroundAccentSecondary;
  final Color backgroundAccentInvert;
  final Color backgroundPositive;
  final Color backgroundNegativePrimary;
  final Color backgroundNegativeSecondary;
  final Color backgroundNegativeInvert;
  final Color backgroundInvertTransparent;
  final Color backgroundInvertModal;
  final Color contentInvertPrimary;
  final Color contentInvertSecondary;
  final Color contentTetriary;
  final Color contentSecondary;
  final Color contentPrimary;
  final Color contentAccentPrimary;
  final Color contentAccentSecondary;
  final Color contentAccentTetriary;
  final Color contentNegative;
  final Color contentPositivePrimary;
  final Color contentPositiveSecondary;
  final Color contentRate;

  @override
  CustomTheme copyWith({
    Color? strokeInvert,
    Color? strokePrimary,
    Color? strokeSecondary,
    Color? strokeAccentPrimary,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? backgroundTetriary,
    Color? backgroundAccentPrimary,
    Color? backgroundAccentSecondary,
    Color? backgroundAccentInvert,
    Color? backgroundPositive,
    Color? backgroundNegativePrimary,
    Color? backgroundNegativeSecondary,
    Color? backgroundNegativeInvert,
    Color? backgroundInvertTransparent,
    Color? backgroundInvertModal,
    Color? contentInvertPrimary,
    Color? contentInvertSecondary,
    Color? contentTetriary,
    Color? contentSecondary,
    Color? contentPrimary,
    Color? contentAccentPrimary,
    Color? contentAccentSecondary,
    Color? contentAccentTetriary,
    Color? contentNegative,
    Color? contentPositivePrimary,
    Color? contentPositiveSecondary,
    Color? contentRate,
  }) {
    return CustomTheme(
      strokeInvert: strokeInvert ?? this.strokeInvert,
      strokePrimary: strokePrimary ?? this.strokePrimary,
      strokeSecondary: strokeSecondary ?? this.strokeSecondary,
      strokeAccentPrimary: strokeAccentPrimary ?? this.strokeAccentPrimary,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundTetriary: backgroundTetriary ?? this.backgroundTetriary,
      backgroundAccentPrimary: backgroundAccentPrimary ?? this.backgroundAccentPrimary,
      backgroundAccentSecondary: backgroundAccentSecondary ?? this.backgroundAccentSecondary,
      backgroundAccentInvert: backgroundAccentInvert ?? this.backgroundAccentInvert,
      backgroundPositive: backgroundPositive ?? this.backgroundPositive,
      backgroundNegativePrimary: backgroundNegativePrimary ?? this.backgroundNegativePrimary,
      backgroundNegativeSecondary: backgroundNegativeSecondary ?? this.backgroundNegativeSecondary,
      backgroundNegativeInvert: backgroundNegativeInvert ?? this.backgroundNegativeInvert,
      backgroundInvertTransparent: backgroundInvertTransparent ?? this.backgroundInvertTransparent,
      backgroundInvertModal: backgroundInvertModal ?? this.backgroundInvertModal,
      contentInvertPrimary: contentInvertPrimary ?? this.contentInvertPrimary,
      contentInvertSecondary: contentInvertSecondary ?? this.contentInvertSecondary,
      contentTetriary: contentTetriary ?? this.contentTetriary,
      contentSecondary: contentSecondary ?? this.contentSecondary,
      contentPrimary: contentPrimary ?? this.contentPrimary,
      contentAccentPrimary: contentAccentPrimary ?? this.contentAccentPrimary,
      contentAccentSecondary: contentAccentSecondary ?? this.contentAccentSecondary,
      contentAccentTetriary: contentAccentTetriary ?? this.contentAccentTetriary,
      contentNegative: contentNegative ?? this.contentNegative,
      contentPositivePrimary: contentPositivePrimary ?? this.contentPositivePrimary,
      contentPositiveSecondary: contentPositiveSecondary ?? this.contentPositiveSecondary,
      contentRate: contentRate ?? this.contentRate,
    );
  }

  @override
  CustomTheme lerp(CustomTheme? other, double t) {
    if (other == null) {
      return this;
    }

    return CustomTheme(
      strokeInvert: Color.lerp(strokeInvert, other.strokeInvert, t) ?? strokeInvert,
      strokePrimary: Color.lerp(strokePrimary, other.strokePrimary, t) ?? strokePrimary,
      strokeSecondary: Color.lerp(strokeSecondary, other.strokeSecondary, t) ?? strokeSecondary,
      strokeAccentPrimary: Color.lerp(strokeAccentPrimary, other.strokeAccentPrimary, t) ?? strokeAccentPrimary,
      backgroundPrimary: Color.lerp(backgroundPrimary, other.backgroundPrimary, t) ?? backgroundPrimary,
      backgroundSecondary: Color.lerp(backgroundSecondary, other.backgroundSecondary, t) ?? backgroundSecondary,
      backgroundTetriary: Color.lerp(backgroundTetriary, other.backgroundTetriary, t) ?? backgroundTetriary,
      backgroundAccentPrimary:
          Color.lerp(backgroundAccentPrimary, other.backgroundAccentPrimary, t) ?? backgroundAccentPrimary,
      backgroundAccentSecondary:
          Color.lerp(backgroundAccentSecondary, other.backgroundAccentSecondary, t) ?? backgroundAccentSecondary,
      backgroundAccentInvert:
          Color.lerp(backgroundAccentInvert, other.backgroundAccentInvert, t) ?? backgroundAccentInvert,
      backgroundPositive: Color.lerp(backgroundPositive, other.backgroundPositive, t) ?? backgroundPositive,
      backgroundNegativePrimary:
          Color.lerp(backgroundNegativePrimary, other.backgroundNegativePrimary, t) ?? backgroundNegativePrimary,
      backgroundNegativeSecondary:
          Color.lerp(backgroundNegativeSecondary, other.backgroundNegativeSecondary, t) ?? backgroundNegativeSecondary,
      backgroundNegativeInvert:
          Color.lerp(backgroundNegativeInvert, other.backgroundNegativeInvert, t) ?? backgroundNegativeInvert,
      backgroundInvertTransparent:
          Color.lerp(backgroundInvertTransparent, other.backgroundInvertTransparent, t) ?? backgroundInvertTransparent,
      backgroundInvertModal: Color.lerp(backgroundInvertModal, other.backgroundInvertModal, t) ?? backgroundInvertModal,
      contentInvertPrimary: Color.lerp(contentInvertPrimary, other.contentInvertPrimary, t) ?? contentInvertPrimary,
      contentInvertSecondary:
          Color.lerp(contentInvertSecondary, other.contentInvertSecondary, t) ?? contentInvertSecondary,
      contentTetriary: Color.lerp(contentTetriary, other.contentTetriary, t) ?? contentTetriary,
      contentSecondary: Color.lerp(contentSecondary, other.contentSecondary, t) ?? contentSecondary,
      contentPrimary: Color.lerp(contentPrimary, other.contentPrimary, t) ?? contentPrimary,
      contentAccentPrimary: Color.lerp(contentAccentPrimary, other.contentAccentPrimary, t) ?? contentAccentPrimary,
      contentAccentSecondary:
          Color.lerp(contentAccentSecondary, other.contentAccentSecondary, t) ?? contentAccentSecondary,
      contentAccentTetriary: Color.lerp(contentAccentTetriary, other.contentAccentTetriary, t) ?? contentAccentTetriary,
      contentNegative: Color.lerp(contentNegative, other.contentNegative, t) ?? contentNegative,
      contentPositivePrimary:
          Color.lerp(contentPositivePrimary, other.contentPositivePrimary, t) ?? contentPositivePrimary,
      contentPositiveSecondary:
          Color.lerp(contentPositiveSecondary, other.contentPositiveSecondary, t) ?? contentPositiveSecondary,
      contentRate: Color.lerp(contentRate, other.contentRate, t) ?? contentRate,
    );
  }
}
