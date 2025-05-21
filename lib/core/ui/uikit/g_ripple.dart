import 'package:flutter/material.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

class GRipple extends StatelessWidget {
  const GRipple({super.key, this.child, this.borderRadius, this.onPress});

  final Widget? child;
  final BorderRadius? borderRadius;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        borderRadius: borderRadius,
        splashColor: context.colors.backgroundAccentPrimary.withValues(alpha: 0.2),
        child: child,
      ),
    );
  }
}
