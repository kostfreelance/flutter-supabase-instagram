import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';

class AppTextField extends StatefulWidget {
  static final fontSize = 16.sp;
  final InputBorder? border;
  final EdgeInsets? padding;
  final Color? fillColor;
  final TextCapitalization? textCapitalization;
  final bool? autofocus;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final Function(String)? onSearchSubmitted;

  const AppTextField({
    super.key,
    this.border,
    this.padding,
    this.textCapitalization,
    this.fillColor,
    this.autofocus,
    this.maxLines = 1,
    this.keyboardType,
    this.readOnly,
    this.obscureText = false,
    required this.hintText,
    this.controller,
    required this.onChanged,
    this.onSearchSubmitted
  });

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

final class AppTextFieldState extends State<AppTextField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
    TextField(
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        enabledBorder: widget.border ?? InputBorder.none,
        focusedBorder: widget.border ?? InputBorder.none,
        contentPadding: widget.padding ?? EdgeInsets.zero,
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        hintStyle: TextStyle(
          fontSize: AppTextField.fontSize,
          height: 1,
          color: context.colors.onSurfaceVariant
        ),
        hintText: widget.hintText
      ),
      style: TextStyle(
        fontSize: AppTextField.fontSize,
        height: 1,
        color: context.colors.onSurface
      ),
      cursorWidth: 1.5,
      cursorHeight: AppTextField.fontSize,
      cursorColor: context.colors.onSurface,
      textCapitalization: widget.textCapitalization ?? (
        widget.obscureText ||
        widget.keyboardType == TextInputType.emailAddress ?
          TextCapitalization.none :
          TextCapitalization.sentences
      ),
      textInputAction: widget.onSearchSubmitted != null ?
        TextInputAction.search : null,
      autofocus: widget.autofocus ?? false,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly ?? false,
      obscureText: widget.obscureText,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSearchSubmitted,
      focusNode: _focusNode,
      onTapOutside: (_) => _focusNode.unfocus()
    );
}