import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';

class AppLoaderIndicator extends StatelessWidget {
  static final double size = 50.w;
  const AppLoaderIndicator({super.key});

  @override
  Widget build(BuildContext context) =>
    Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size / 4),
        width: size / 2,
        height: size / 2,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
          strokeWidth: 4.w
        )
      )
    );
}