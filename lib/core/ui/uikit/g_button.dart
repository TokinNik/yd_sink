import 'package:flutter/material.dart';
import 'package:YDsync/core/ui/themes/text_styles.dart';
import 'package:YDsync/core/ui/uikit/g_loader.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

import 'g_text.dart';

class GButton extends StatelessWidget {
  const GButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.title,
    this.onPressed,
    this.icon,
    this.alignment,
    this.isDisabled = false,
    this.isLoading = false,
  });

  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final Widget? icon;
  final bool isDisabled;
  final AlignmentGeometry? alignment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        this.backgroundColor ??
        (isDisabled ? context.colors.backgroundAccentSecondary : context.colors.backgroundAccentPrimary);
    final textColor = this.textColor ?? context.colors.contentInvertPrimary;

    return TextButton.icon(
      icon: icon,
      style: ButtonStyle(
        alignment: alignment,
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 56)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
      ),
      onPressed: (isDisabled || isLoading) ? null : onPressed,
      label:
          isLoading
              ? const GLoader(isInvert: true, isSmall: true)
              : GText(title: title, color: textColor, style: AppTextStyles.textStyle(16, FontWeight.w500)),
    );
  }
}
