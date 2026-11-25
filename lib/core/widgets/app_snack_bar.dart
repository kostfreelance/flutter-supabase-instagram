import 'package:flutter/material.dart';
import 'package:fsi/core/theme/app_theme.dart';

abstract class AppSnackBar {
  static const duration = Duration(milliseconds: 4000);

  static void open(
    BuildContext context, {
      required String text, 
      AppSnackBarType type = AppSnackBarType.success
  }) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          key: type.key,
          style: TextStyle(color: context.colors.onPrimary)
        ),
        backgroundColor: type.color(context),
        duration: duration
      )
    );
}

enum AppSnackBarType {
  success, error;

  Key get key =>
    Key('snackbar_${toString().split('.').last}');

  Color color(BuildContext context) =>
    switch (this) {
      AppSnackBarType.success =>
        context.colors.primary,
      AppSnackBarType.error =>
        context.colors.error
    };
}