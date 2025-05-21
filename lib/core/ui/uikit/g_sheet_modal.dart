import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:YDsync/core/ui/generated/assets.gen.dart';
import 'package:YDsync/core/ui/themes/text_styles.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

import 'g_text.dart';

class GSheetModal extends StatelessWidget {
  const GSheetModal({
    super.key,
    required this.title,
    required this.slivers,
    this.height,
    this.titleStyle,
    this.titleColor,
    this.snapSizes = const [0.5, 1],
    this.padding,
  });

  final String title;
  final List<Widget> slivers;
  final double? height;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final List<double> snapSizes;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      snapSizes: snapSizes,
      initialChildSize: snapSizes.first,
      minChildSize: snapSizes.first - 0.05,
      maxChildSize: snapSizes.last,
      builder:
          (BuildContext context, ScrollController scrollController) => Padding(
            padding: padding ?? const EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GText(
                        title: title,
                        style: titleStyle ?? AppTextStyles.textStyle(16, FontWeight.w400),
                        color: titleColor ?? context.colors.contentPrimary,
                      ),
                      InkWell(child: SvgPicture.asset(Assets.icons.close), onTap: () => context.maybePop()),
                    ],
                  ),
                ),
                Expanded(child: CustomScrollView(controller: scrollController, slivers: slivers)),
              ],
            ),
          ),
    );
  }
}
