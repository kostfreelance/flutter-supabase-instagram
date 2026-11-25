import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';

abstract class AppProgressLoader {
  static final _progressNotifier = ValueNotifier<double>(0);

  static void update(double progress) =>
    _progressNotifier.value = progress;

  static void open(BuildContext context) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
        PopScope(
          canPop: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary)
              ),
              SizedBox(height: 15.h),
              ValueListenableBuilder(
                valueListenable: _progressNotifier,
                builder: (_, progress, _) =>
                  Text(
                    '${(progress * 100).round()}%',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: context.colors.primary
                    )
                  )
              )
            ]
          )
        )
    );

  static void close(BuildContext context) =>
    context.pop();
}