import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final double? width;
  final double? height;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final AlignmentGeometry? alignment;
  final Widget child;
  final Function()? onPressed;

  const AppButton({
    super.key,
    this.width,
    this.height,
    this.border,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
    this.alignment,
    required this.child,
    required this.onPressed
  });

  @override
  AppButtonState createState() => AppButtonState();
}

final class AppButtonState extends State<AppButton> {
  bool _pressed = false;

  void _changePressed({bool withDelay = false}) async {
    if (widget.onPressed != null) {
      if (withDelay) {
        await Future.delayed(const Duration(milliseconds: 200));
      }
      _pressed = !_pressed;
      if (mounted) {setState(() {});}
    }
  }

  @override
  Widget build(BuildContext context) =>
    GestureDetector(
      onTapDown: (_) => _changePressed(),
      onTapUp: (_) => _changePressed(withDelay: true),
      onTapCancel: () => _changePressed(),
      onTap: widget.onPressed,
      child: AnimatedOpacity(
        duration: Duration.zero,
        opacity: widget.onPressed == null || _pressed ? 0.5 : 1,
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.transparent,
            border: widget.border,
            borderRadius: widget.borderRadius
          ),
          child: Align(
            alignment: widget.alignment ?? Alignment.center,
            child: widget.child
          )
        )
      )
    );
}