import 'dart:math';
import 'package:flutter/material.dart';

class AppScreenUtil {
  static late Size _designSize;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _scaleWidth;
  static late double _scaleHeight;
  static late double _scaleText;

  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;
  static double get statusBarHeight => _statusBarHeight;
  static double get bottomBarHeight => _bottomBarHeight;
  static double get scaleWidth => _scaleWidth;
  static double get scaleHeight => _scaleHeight;
  static double get scaleText => _scaleText;
  static double get scaleRadius => min(_scaleWidth, _scaleHeight);

  static void init(
    BuildContext context,
    Size designSize
  ) {
    _designSize = designSize;
    final mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    final paddingOf = MediaQuery.viewPaddingOf(context);
    _statusBarHeight = paddingOf.top;
    _bottomBarHeight = paddingOf.bottom;
    _scaleWidth = _screenWidth / _designSize.width;
    _scaleHeight = _screenHeight / _designSize.height;
    _scaleText = _scaleWidth;
  }
}

extension AppScreenUtilExtension on num {
  double get w => this * AppScreenUtil.scaleWidth;
  double get h => this * AppScreenUtil.scaleHeight;
  double get r => this * AppScreenUtil.scaleRadius;
  double get sp => this * AppScreenUtil.scaleText;
}

class AppScreenUtilInit extends StatelessWidget {
  final Size designSize;
  final Widget Function(BuildContext context) builder;

  const AppScreenUtilInit({
    super.key,
    required this.designSize,
    required this.builder
  });

  @override
  Widget build(BuildContext context) =>
    Builder(
      builder: (context) {
        AppScreenUtil.init(context, designSize);
        return builder(context);
      }
    );
}