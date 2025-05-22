/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();

  /// File path: assets/gifs/snoop_dogg.gif
  AssetGenImage get snoopDogg =>
      const AssetGenImage('assets/gifs/snoop_dogg.gif');

  /// List of all assets
  List<AssetGenImage> get values => [snoopDogg];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Property 1=Default.svg
  String get property1Default => 'assets/icons/Property 1=Default.svg';

  /// File path: assets/icons/Property 1=Variant2.svg
  String get property1Variant2 => 'assets/icons/Property 1=Variant2.svg';

  /// File path: assets/icons/arrow-left.svg
  String get arrowLeft => 'assets/icons/arrow-left.svg';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/calendar_small.svg
  String get calendarSmall => 'assets/icons/calendar_small.svg';

  /// File path: assets/icons/camera.svg
  String get camera => 'assets/icons/camera.svg';

  /// File path: assets/icons/check.svg
  String get check => 'assets/icons/check.svg';

  /// File path: assets/icons/checkMark.svg
  String get checkMark => 'assets/icons/checkMark.svg';

  /// File path: assets/icons/chevron-down-1.svg
  String get chevronDown1 => 'assets/icons/chevron-down-1.svg';

  /// File path: assets/icons/chevron-down.svg
  String get chevronDownSvg => 'assets/icons/chevron-down.svg';

  /// File path: assets/icons/chevronDown.svg
  String get chevronDownSvg_ => 'assets/icons/chevronDown.svg';

  /// File path: assets/icons/chevronLeft.svg
  String get chevronLeft => 'assets/icons/chevronLeft.svg';

  /// File path: assets/icons/chevronRight.svg
  String get chevronRight => 'assets/icons/chevronRight.svg';

  /// File path: assets/icons/close.svg
  String get close => 'assets/icons/close.svg';

  /// File path: assets/icons/closeFilled.svg
  String get closeFilled => 'assets/icons/closeFilled.svg';

  /// File path: assets/icons/edit.svg
  String get edit => 'assets/icons/edit.svg';

  /// File path: assets/icons/eye-off.svg
  String get eyeOff => 'assets/icons/eye-off.svg';

  /// File path: assets/icons/eye.svg
  String get eye => 'assets/icons/eye.svg';

  /// File path: assets/icons/filterMenuItemContractor.svg
  String get filterMenuItemContractor =>
      'assets/icons/filterMenuItemContractor.svg';

  /// File path: assets/icons/filterMenuItemFilter.svg
  String get filterMenuItemFilter => 'assets/icons/filterMenuItemFilter.svg';

  /// File path: assets/icons/filterMenuItemSort.svg
  String get filterMenuItemSort => 'assets/icons/filterMenuItemSort.svg';

  /// File path: assets/icons/filterMenuItemTaskType.svg
  String get filterMenuItemTaskType =>
      'assets/icons/filterMenuItemTaskType.svg';

  /// File path: assets/icons/filterMenuItemView.svg
  String get filterMenuItemView => 'assets/icons/filterMenuItemView.svg';

  /// File path: assets/icons/image.svg
  String get image => 'assets/icons/image.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/logoSmall.svg
  String get logoSmall => 'assets/icons/logoSmall.svg';

  /// File path: assets/icons/logo_big.svg
  String get logoBig => 'assets/icons/logo_big.svg';

  /// File path: assets/icons/maximize-2.svg
  String get maximize2 => 'assets/icons/maximize-2.svg';

  /// File path: assets/icons/menu.svg
  String get menu => 'assets/icons/menu.svg';

  /// File path: assets/icons/plan.svg
  String get plan => 'assets/icons/plan.svg';

  /// File path: assets/icons/plus-1.svg
  String get plus1 => 'assets/icons/plus-1.svg';

  /// File path: assets/icons/plus.svg
  String get plus => 'assets/icons/plus.svg';

  /// File path: assets/icons/refresh-cw.svg
  String get refreshCw => 'assets/icons/refresh-cw.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/swap.svg
  String get swap => 'assets/icons/swap.svg';

  /// File path: assets/icons/trash.svg
  String get trash => 'assets/icons/trash.svg';

  /// File path: assets/icons/wifi-off.svg
  String get wifiOff => 'assets/icons/wifi-off.svg';

  /// File path: assets/icons/wifi.svg
  String get wifi => 'assets/icons/wifi.svg';

  /// File path: assets/icons/xMark.svg
  String get xMark => 'assets/icons/xMark.svg';

  /// List of all assets
  List<String> get values => [
    property1Default,
    property1Variant2,
    arrowLeft,
    calendar,
    calendarSmall,
    camera,
    check,
    checkMark,
    chevronDown1,
    chevronDownSvg,
    chevronDownSvg_,
    chevronLeft,
    chevronRight,
    close,
    closeFilled,
    edit,
    eyeOff,
    eye,
    filterMenuItemContractor,
    filterMenuItemFilter,
    filterMenuItemSort,
    filterMenuItemTaskType,
    filterMenuItemView,
    image,
    logo,
    logoSmall,
    logoBig,
    maximize2,
    menu,
    plan,
    plus1,
    plus,
    refreshCw,
    search,
    swap,
    trash,
    wifiOff,
    wifi,
    xMark,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/tempLogo.png
  AssetGenImage get tempLogo =>
      const AssetGenImage('assets/images/tempLogo.png');

  /// List of all assets
  List<AssetGenImage> get values => [tempLogo];
}

class Assets {
  const Assets._();

  static const $AssetsGifsGen gifs = $AssetsGifsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
