import 'package:flutter/material.dart';

import '../core/colors.dart';
import '../core/text_styles.dart';

class GeneralButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? height;
  final double? minWidth;
  final EdgeInsets margins;
  final bool isOutlined;
  final Color? outlineColor;
  final double borderRadius;
  final bool isButtonDisabled;
  final EdgeInsetsGeometry padding;
  final Widget? iconWidget;
  final Color textColor;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double iconPadding;
  final double elevation;
  final Color? shadowColor;

  GeneralButtonWidget({
    super.key,
    this.text = '',
    this.onTap,
    this.height,
    this.margins = const EdgeInsets.all(0),
    this.minWidth,
    this.isOutlined = false,
    this.outlineColor,
    this.isButtonDisabled = false,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    this.textStyle,
    this.iconWidget,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.blueMain,
    this.iconPadding = 8,
    this.elevation = 0,
    this.shadowColor,
  });

  final TextStyle _defaultButtonTextStyle = AppTextStyles.s16semibold.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margins,
      child: isOutlined
          ? _buildOutlinedButton(context)
          : _buildMaterialButton(context),
    );
  }

  Widget _buildMaterialButton(BuildContext context) {
    OutlinedBorder shape = const StadiumBorder();
    final radius = borderRadius;
    shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    );
    final foregroundColor = isButtonDisabled ? AppColors.white : textColor;
    final bgColor = isButtonDisabled
        ? AppColors.blueMain.withOpacity(.55)
        : backgroundColor;
    final buttonStyle = ButtonStyle(
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(padding),
      // textStyle: MaterialStateProperty.all(
      //   textStyle ?? _defaultButtonTextStyle,
      // ),
      foregroundColor: MaterialStatePropertyAll<Color>(foregroundColor),
      backgroundColor: MaterialStatePropertyAll<Color>(bgColor),
      shape: MaterialStateProperty.all(shape),
      shadowColor:
          MaterialStatePropertyAll<Color>(shadowColor ?? AppColors.black05),
    );
    return SizedBox(
      height: height,
      width: minWidth,
      child: ElevatedButton(
        onPressed: isButtonDisabled ? null : onTap,
        style: buttonStyle,
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget ?? const SizedBox.shrink(),
            iconWidget != null
                ? SizedBox(width: iconPadding)
                : const SizedBox.shrink(),
            Text(
              text,
              style: textStyle ?? _defaultButtonTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context) {
    final foregroundColor = isButtonDisabled ? textColor.withOpacity(0.3) : textColor;
    final borderColor = isButtonDisabled ? backgroundColor.withOpacity(0.3) : backgroundColor;
    final buttonStyle = ButtonStyle(
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(padding),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(width: 2, color: borderColor),
        ),
      ),
      side: MaterialStatePropertyAll(
        BorderSide(width: 2, color: borderColor),
      ),
      // textStyle: MaterialStateProperty.all(
      //   textStyle ?? _defaultButtonTextStyle,
      // ),
      foregroundColor: MaterialStatePropertyAll<Color>(foregroundColor),
    );
    return SizedBox(
      height: height,
      width: minWidth,
      child: OutlinedButton(
        onPressed: isButtonDisabled ? null : onTap,
        style: buttonStyle,
        child: Text(
          text,
          style: textStyle ?? _defaultButtonTextStyle,
        ),
      ),
    );
  }
}
