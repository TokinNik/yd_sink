import 'package:flutter/material.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme({
    required this.main,
    required this.second,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
  });

  final Color? main;
  final Color? second;
  final Color? success;
  final Color? warning;
  final Color? error;
  final Color? info;

  @override
  CustomTheme copyWith({
    Color? main,
    Color? second,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
  }) {
    return CustomTheme(
      main: main ?? this.main,
      second: second ?? this.second,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
    );
  }

  @override
  CustomTheme lerp(CustomTheme? other, double t) {
    if (other is! CustomTheme) {
      return this;
    }
    return CustomTheme(
      main: Color.lerp(main, other.main, t),
      second: Color.lerp(second, other.second, t),
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
      error: Color.lerp(error, other.error, t),
      info: Color.lerp(info, other.info, t),
    );
  }
}
