/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/add.svg
  SvgGenImage get add => const SvgGenImage('assets/svg/add.svg');

  /// File path: assets/svg/check_box_new.svg
  SvgGenImage get checkBoxNew =>
      const SvgGenImage('assets/svg/check_box_new.svg');

  /// File path: assets/svg/checkbox_empty.svg
  SvgGenImage get checkboxEmpty =>
      const SvgGenImage('assets/svg/checkbox_empty.svg');

  /// File path: assets/svg/checkbox_filled.svg
  SvgGenImage get checkboxFilled =>
      const SvgGenImage('assets/svg/checkbox_filled.svg');

  /// File path: assets/svg/deadline.svg
  SvgGenImage get deadline => const SvgGenImage('assets/svg/deadline.svg');

  /// File path: assets/svg/dropdown_arrow.svg
  SvgGenImage get dropdownArrow =>
      const SvgGenImage('assets/svg/dropdown_arrow.svg');

  /// File path: assets/svg/edit_pencil.svg
  SvgGenImage get editPencil => const SvgGenImage('assets/svg/edit_pencil.svg');

  /// File path: assets/svg/no_timers.svg
  SvgGenImage get noTimers => const SvgGenImage('assets/svg/no_timers.svg');

  /// File path: assets/svg/pause.svg
  SvgGenImage get pause => const SvgGenImage('assets/svg/pause.svg');

  /// File path: assets/svg/play.svg
  SvgGenImage get play => const SvgGenImage('assets/svg/play.svg');

  /// File path: assets/svg/project.svg
  SvgGenImage get project => const SvgGenImage('assets/svg/project.svg');

  /// File path: assets/svg/star_empty.svg
  SvgGenImage get starEmpty => const SvgGenImage('assets/svg/star_empty.svg');

  /// File path: assets/svg/star_filled.svg
  SvgGenImage get starFilled => const SvgGenImage('assets/svg/star_filled.svg');

  /// File path: assets/svg/stop.svg
  SvgGenImage get stop => const SvgGenImage('assets/svg/stop.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        add,
        checkBoxNew,
        checkboxEmpty,
        checkboxFilled,
        deadline,
        dropdownArrow,
        editPencil,
        noTimers,
        pause,
        play,
        project,
        starEmpty,
        starFilled,
        stop
      ];
}

class Assets {
  Assets._();

  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
