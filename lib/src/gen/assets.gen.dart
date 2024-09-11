/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bayroq.png
  AssetGenImage get bayroq => const AssetGenImage('assets/icons/bayroq.png');

  /// File path: assets/icons/location.png
  AssetGenImage get location => const AssetGenImage('assets/icons/location.png');

  /// File path: assets/icons/location_soccer.png
  AssetGenImage get locationSoccer =>
      const AssetGenImage('assets/icons/location_soccer.png');

  /// File path: assets/icons/pin.png
  AssetGenImage get pin => const AssetGenImage('assets/icons/pin.png');

  /// List of all assets
  List<AssetGenImage> get values => [bayroq, location, locationSoccer, pin];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/boglanish.svg
  SvgGenImage get boglanish => const SvgGenImage('assets/images/boglanish.svg');

  /// File path: assets/images/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/images/calendar.svg');

  /// File path: assets/images/calendar_blue.svg
  SvgGenImage get calendarBlue => const SvgGenImage('assets/images/calendar_blue.svg');

  /// File path: assets/images/favorite_empty.svg
  SvgGenImage get favoriteEmpty => const SvgGenImage('assets/images/favorite_empty.svg');

  /// File path: assets/images/home.svg
  SvgGenImage get home => const SvgGenImage('assets/images/home.svg');

  /// File path: assets/images/home_blue.svg
  SvgGenImage get homeBlue => const SvgGenImage('assets/images/home_blue.svg');

  /// File path: assets/images/kalendar.png
  AssetGenImage get kalendar => const AssetGenImage('assets/images/kalendar.png');

  /// File path: assets/images/language.svg
  SvgGenImage get language => const SvgGenImage('assets/images/language.svg');

  /// File path: assets/images/loaction.png
  AssetGenImage get loaction => const AssetGenImage('assets/images/loaction.png');

  /// File path: assets/images/location.svg
  SvgGenImage get location => const SvgGenImage('assets/images/location.svg');

  /// File path: assets/images/logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/images/logout.svg');

  /// File path: assets/images/mavsum.png
  AssetGenImage get mavsum => const AssetGenImage('assets/images/mavsum.png');

  /// File path: assets/images/navigator.svg
  SvgGenImage get navigator => const SvgGenImage('assets/images/navigator.svg');

  /// File path: assets/images/notification.svg
  SvgGenImage get notification => const SvgGenImage('assets/images/notification.svg');

  /// File path: assets/images/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/images/profile.svg');

  /// File path: assets/images/profile_blue.svg
  SvgGenImage get profileBlue => const SvgGenImage('assets/images/profile_blue.svg');

  /// File path: assets/images/save.svg
  SvgGenImage get save => const SvgGenImage('assets/images/save.svg');

  /// File path: assets/images/soccer.png
  AssetGenImage get soccer => const AssetGenImage('assets/images/soccer.png');

  /// File path: assets/images/tavsiya.png
  AssetGenImage get tavsiya => const AssetGenImage('assets/images/tavsiya.png');

  /// List of all assets
  List<dynamic> get values => [
        boglanish,
        calendar,
        calendarBlue,
        favoriteEmpty,
        home,
        homeBlue,
        kalendar,
        language,
        loaction,
        location,
        logout,
        mavsum,
        navigator,
        notification,
        profile,
        profileBlue,
        save,
        soccer,
        tavsiya
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/loading.json
  LottieGenImage get loading => const LottieGenImage('assets/lottie/loading.json');

  /// File path: assets/lottie/network.json
  LottieGenImage get network => const LottieGenImage('assets/lottie/network.json');

  /// File path: assets/lottie/network2.json
  LottieGenImage get network2 => const LottieGenImage('assets/lottie/network2.json');

  /// File path: assets/lottie/not.json
  LottieGenImage get not => const LottieGenImage('assets/lottie/not.json');

  /// File path: assets/lottie/not_found.json
  LottieGenImage get notFound => const LottieGenImage('assets/lottie/not_found.json');

  /// List of all assets
  List<LottieGenImage> get values => [loading, network, network2, not, notFound];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(
    this._assetName, {
    this.flavors = const {},
  });

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(
      BuildContext,
      Widget,
      _lottie.LottieComposition?,
    )? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
