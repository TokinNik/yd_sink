import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/core.dart';

class GeneralIconButton extends StatelessWidget {
  GeneralIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.onLongPress,
    this.iconColor,
    this.backgroundColor,
    this.iconWidth = 20,
    this.iconHeight = 20,
    this.radius = 25,
    this.iconPadding,
  });

  final String iconPath;
  final Function()? onTap;
  final Function()? onLongPress;
  final Color? iconColor;
  final Color? backgroundColor;
  final double iconWidth;
  final double iconHeight;
  final double radius;
  final EdgeInsets? iconPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? AppColors.transparent,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: iconPadding ?? const EdgeInsets.all(15),
          child: SvgPicture.asset(
            iconPath,
            color: iconColor,
            height: iconHeight,
            width: iconWidth,
          ),
        ),
      ),
    );
  }
}
