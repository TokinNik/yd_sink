import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:YDsync/core/ui/generated/assets.gen.dart';
import 'package:YDsync/core/ui/themes/text_styles.dart';
import 'package:YDsync/core/ui/uikit/g_text.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GAppBar({
    super.key,
    this.height = 56,
    this.title,
    this.onPressed,
    this.isHideBack = false,
    this.isTransparent = false,
    this.isInvert = false,
    this.leading,
    this.center,
  });

  final double height;
  final String? title;
  final Function()? onPressed;
  final bool isHideBack;
  final bool isTransparent;
  final bool isInvert;
  final Widget? leading;
  final Widget? center;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          leading ??
          (isHideBack
              ? null
              : IconButton(
                icon: SvgPicture.asset(
                  Assets.icons.closeFilled,
                  colorFilter: ColorFilter.mode(
                    isInvert ? context.colors.contentInvertPrimary : context.colors.contentPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () => onPressed == null ? context.maybePop() : onPressed!(),
              )),
      elevation: 0,
      backgroundColor: isTransparent ? Colors.transparent : context.colors.backgroundPrimary,
      foregroundColor: context.colors.contentPrimary,
      title:
          center ??
          (title != null
              ? Padding(
                padding: EdgeInsets.only(left: isHideBack ? 20 : 0),
                child: GText(title: title!, style: AppTextStyles.textStyle(24, FontWeight.bold)),
              )
              : null),
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
