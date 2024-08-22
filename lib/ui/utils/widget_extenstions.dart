import 'package:flutter/cupertino.dart';
import 'package:template_app/core/constants/app_constants.dart';

extension WidgetExt on Widget {
  Size textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

extension BuildContextExt on BuildContext {
  bool get isTablet {
    final data = MediaQueryData.fromView(View.of(this));
    return data.size.shortestSide >= AppConstants.minTabletWidth;
  }
}
