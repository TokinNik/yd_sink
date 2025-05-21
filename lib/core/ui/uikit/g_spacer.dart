import 'package:flutter/cupertino.dart';

class GSpacer extends StatelessWidget {
  const GSpacer({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
