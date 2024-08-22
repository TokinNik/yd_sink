import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/core.dart';

class GeneralNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final Color? bgColor;

  const GeneralNetworkImage({
    super.key,
    required this.url,
    this.fit,
    this.bgColor = AppColors.grayMain,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return _buildErrorWidget();
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      placeholder: (_, __) {
        return Container(color: bgColor);
      },
      errorWidget: (_, __, ___) {
        return _buildErrorWidget();
      },
      imageBuilder: (context, imageProvider) {
        return Ink.image(
          image: imageProvider,
          fit: fit,
        );
      },
    );
  }

  Container _buildErrorWidget() {
    return Container(color: bgColor);
  }
}
