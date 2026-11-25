import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';

class NoDataLabel extends StatelessWidget {
  final String label;
  const NoDataLabel(this.label, {super.key});

  @override
  Widget build(BuildContext context) =>
    Center(
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: context.colors.onSurface
        )
      )
    );
}