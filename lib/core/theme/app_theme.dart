import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light =>
    ThemeData(
      fontFamily: 'Lato-Regular',
      scaffoldBackgroundColor: AppThemeColors.white900,
      colorScheme: const ColorScheme.light(
        primary: AppThemeColors.blue900,
        onPrimary: AppThemeColors.white900,
        surfaceContainerLow: AppThemeColors.grey100,
        onSurface: AppThemeColors.black900,
        onSurfaceVariant: AppThemeColors.grey900,
        outline: AppThemeColors.grey500,
        error: AppThemeColors.red900
      )
    );
}

abstract class AppThemeColors {
  static const Color black900 = Color(0xff000000);
  static const Color white900 = Color(0xffFFFFFF);
  static const Color grey100 = Color(0xffFAFAFA);
  static const Color grey500 = Color(0xffC6C6C6);
  static const Color grey900 = Color(0xff616161);
  static const Color blue900 = Color(0xff2663FF);
  static const Color red900 = Colors.red;
}

extension AppThemeBuildContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}