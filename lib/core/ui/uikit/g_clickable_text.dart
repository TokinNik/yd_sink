import 'package:flutter/material.dart';
import 'package:YDsync/core/ui/uikit/g_ripple.dart';
import 'package:YDsync/core/ui/uikit/g_text.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

class GClickableText extends StatelessWidget {
  const GClickableText({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.size,
    this.style,
    this.onPress,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.clip,
  });

  final String title;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final TextStyle? style;
  final Function()? onPress;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? context.colors.contentPrimary;

    return GRipple(
      onPress: onPress,
      child: GText(
        title: title,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        color: color,
        style:
            style?.copyWith(color: color, fontWeight: weight, fontSize: size) ??
            TextStyle(color: color, fontWeight: weight, fontSize: size),
      ),
    );
  }
}
