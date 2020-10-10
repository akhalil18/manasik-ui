import 'package:flutter/material.dart';

enum DeviceType { Desktop, Mobile, Tablet }

class ScreenUtil {
  static const int defaultWidth = 1080;
  static const int defaultHeight = 1920;

  /// Size of the phone in UI Design , px
  static num uiWidthPx;
  static num uiHeightPx;

  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _statusBarHeight;
  static double _bottomBarHeight;

  static void init(BuildContext context,
      {num width = defaultWidth, num height = defaultHeight}) {
    uiWidthPx = width;
    uiHeightPx = height;

    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
  }

  static DeviceType getDeviceType(MediaQueryData mediaQuery) {
    // fixed width changes with oreintation
    final deviceWidth = mediaQuery.size.shortestSide;

    if (deviceWidth > 950) {
      return DeviceType.Desktop;
    } else if (deviceWidth > 600) {
      return DeviceType.Tablet;
    } else {
      return DeviceType.Mobile;
    }
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  /// The horizontal extent of this size.
  static double get screenWidthDp => _screenWidth;

  ///The vertical extent of this size. dp
  static double get screenHeightDp => _screenHeight;

  static bool get portrait =>
      _mediaQueryData.orientation == Orientation.portrait;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight;

  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  // /// The ratio of the actual dp to the design draft px
  // static double get scaleWidth => _screenWidth / uiWidthPx;

  // static double get scaleHeight => _screenHeight / uiHeightPx;
}
