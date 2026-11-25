import 'package:flutter/material.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_text_field.dart';

class AuthTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final bool obscureText;
  final String hintText;
  final Function(String) onChanged;

  const AuthTextField({
    super.key,
    this.keyboardType,
    this.obscureText = false,
    required this.hintText,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) =>
    AppTextField(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(
          width: 0.5,
          color: context.colors.outline
        )
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12.w,
        horizontal: 14.w
      ),
      fillColor: context.colors.surfaceContainerLow,
      keyboardType: keyboardType,
      obscureText: obscureText,
      hintText: hintText,
      onChanged: onChanged
    );
}