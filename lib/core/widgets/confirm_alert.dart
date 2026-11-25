import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';

abstract class ConfirmAlert {
  static void open(
    BuildContext context, {
      required String title,
      required Function() onConfirmPressed
  }) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
        PopScope(
          canPop: false,
          child: AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(22.w, 22.w, 22.w, 12.w),
            actionsPadding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.w),
            backgroundColor: context.colors.onPrimary,
            content: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                color: context.colors.onSurface
              )
            ),
            actions: [
              TextButton(
                onPressed: context.pop,
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: context.colors.primary
                  )
                )
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                  onConfirmPressed();
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: context.colors.primary
                  )
                )
              )
            ]
          )
        )
    );
}