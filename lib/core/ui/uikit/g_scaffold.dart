import 'package:flutter/material.dart';
import 'package:YDsync/core/ui/uikit/g_app_bar.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

class GScaffold extends StatelessWidget {
  const GScaffold({
    super.key,
    this.body,
    this.appBar,
    this.title,
    this.onPressed,
    this.isHideBack = false,
    this.extendBodyBehindAppBar = false,
    this.isInvert = false,
    this.bottomAppBar,
  });

  final Widget? body;
  final PreferredSizeWidget? appBar;
  final String? title;
  final Function()? onPressed;
  final bool isHideBack;
  final bool extendBodyBehindAppBar;
  final bool isInvert;
  final Widget? bottomAppBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        bottomNavigationBar: (bottomAppBar != null) ? bottomAppBar : null,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: context.colors.backgroundPrimary,
        appBar:
            appBar ??
            GAppBar(
              title: title,
              onPressed: onPressed,
              isHideBack: isHideBack,
              isTransparent: extendBodyBehindAppBar,
              isInvert: isInvert,
            ),
        body: body,
      ),
    );
  }
}
