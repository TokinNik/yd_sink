import 'package:flutter/material.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

class GLoader extends StatelessWidget {
  const GLoader({super.key, this.isInvert = false, this.isSmall = false});

  final bool isInvert;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: isSmall ? 24 : 32,
        width: isSmall ? 24 : 32,
        child: CircularProgressIndicator(
          strokeWidth: isSmall ? 3 : 4,
          color: isInvert ? context.colors.contentInvertPrimary : context.colors.contentAccentPrimary,
        ),
      ),
    );
  }
}
