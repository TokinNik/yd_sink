import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:YDsync/core/constants/ui_constants.dart';
import 'package:YDsync/core/i10n/strings.g.dart';
import 'package:YDsync/core/ui/generated/assets.gen.dart';
import 'package:YDsync/core/ui/themes/text_styles.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';
import 'package:YDsync/environment/environments.dart';

showTopPopUp({
  required BuildContext context,
  String? title,
  required String message,
  bool isError = true,
  String? iconPath,
}) {
  var titleText = title ?? (isError ? S.popup.warning_title : null);
  Flushbar? bar;
  dismissBar() => bar?.dismiss();
  bar = Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    maxWidth: Environment.isTablet ? 400 : null,
    messageText: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: context.colors.backgroundNegativePrimary,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
          child: Row(
            children: [
              Expanded(child: Text("TEMPLATE", style: AppTextStyles.s13regular, textAlign: TextAlign.start)),
              GestureDetector(onTap: dismissBar, child: SvgPicture.asset(Assets.icons.closeFilled, width: 16)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText == null
                  ? const SizedBox.shrink()
                  : Text(titleText, style: AppTextStyles.s14bold, textAlign: TextAlign.start),
              titleText == null ? const SizedBox.shrink() : const SizedBox(height: 4),
              Text(message, style: AppTextStyles.s14regular, textAlign: TextAlign.start),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: context.colors.contentPositivePrimary,
    borderRadius: BorderRadius.circular(12),
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    margin: const EdgeInsets.only(left: 16, right: 16),
    positionOffset: UiConstants.navigationBarHeight,
    boxShadows: [
      BoxShadow(
        offset: const Offset(0.0, 10.0),
        blurRadius: 22.0,
        spreadRadius: 10,
        color: context.colors.contentAccentPrimary,
      ),
    ],
    duration: const Duration(seconds: 10),
    //UIConstants.errorPopUpDuration,
    dismissDirection: FlushbarDismissDirection.VERTICAL,
  );
  bar.show(context);
}
