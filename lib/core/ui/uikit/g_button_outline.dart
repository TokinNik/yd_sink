import 'package:flutter/material.dart';
import 'package:YDsync/core/ui/uikit/g_button.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

class GButtonOutline extends StatelessWidget {
  const GButtonOutline({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.title,
    this.onPressed,
    this.isDisabled = false,
  });

  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GButton(
      title: title,
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? Colors.transparent,
      textColor: textColor ?? context.colors.contentAccentPrimary,
      isDisabled: isDisabled,
    );
  }
}
