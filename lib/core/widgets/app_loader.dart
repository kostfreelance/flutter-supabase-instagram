import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_loader_indicator.dart';

abstract class AppLoader {
  static void open(BuildContext context) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
        PopScope(
          canPop: false,
          child: const AppLoaderIndicator()
        )
    );

  static void close(BuildContext context) =>
    context.pop();
}