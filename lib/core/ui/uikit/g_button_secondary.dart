import 'package:flutter/material.dart';
import 'package:YDsync/core/ui/uikit/g_button.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

class GButtonSecondary extends StatelessWidget {
  const GButtonSecondary({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.title,
    this.onPressed,
    this.icon,
    this.alignment,
  });

  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final Widget? icon;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.backgroundColor ?? context.colors.backgroundSecondary;
    final textColor = this.textColor ?? context.colors.contentPrimary;

    return GButton(
      title: title,
      backgroundColor: backgroundColor,
      textColor: textColor,
      onPressed: onPressed,
      icon: icon,
      alignment: alignment,
    );
  }
}
