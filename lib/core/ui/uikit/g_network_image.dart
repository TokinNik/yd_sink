import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:YDsync/core/ui/uikit/g_loader.dart';

class GNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final Color? bgColor;
  final double? width;
  final double? height;

  const GNetworkImage({super.key, required this.url, this.fit, this.bgColor, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return _buildErrorWidget();
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 100),
      fadeOutDuration: const Duration(milliseconds: 100),
      placeholderFadeInDuration: const Duration(milliseconds: 100),
      width: width,
      height: height,
      imageUrl: url,
      fit: fit,
      placeholder: (_, __) {
        return _buildLoadingWidget();
      },
      errorWidget: (_, __, ___) {
        return _buildErrorWidget();
      },
      imageBuilder: (context, imageProvider) {
        return Image(width: width, height: height, image: imageProvider, fit: fit);
      },
    );
  }

  Widget _buildErrorWidget() {
    return const Placeholder();
  }

  Widget _buildLoadingWidget() {
    return const GLoader();
  }
}
