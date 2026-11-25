import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';

class AppImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const AppImage._({
    super.key,
    required this.url,
    required this.width,
    required this.height
  });

  factory AppImage.network(
    String url, {
      Key? key,
      double? width,
      double? height
  }) =>
    AppImage._(
      key: key,
      url: url,
      width: width,
      height: height
    );

  @override
  Widget build(BuildContext context) =>
    Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return Container(color: context.colors.onSurface);
      }
    );
}

class AppAvatar extends StatelessWidget {
  final String? url;
  final double size;

  const AppAvatar(
    this.url, {
      super.key,
      required this.size
  });

  @override
  Widget build(BuildContext context) =>
    url != null ?
      CircleAvatar(
        radius: size / 2,
        backgroundColor: context.colors.onSurface,
        backgroundImage: NetworkImage(url!)
      ) :
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: context.colors.onSurface,
          shape: BoxShape.circle
        )
      );
}

class AppThumb extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const AppThumb(
    this.url, {
      super.key,
      this.width,
      this.height
  });

  @override
  Widget build(BuildContext context) =>
    SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: AppImage.network(url)
          ),
          Positioned(
            right: 5.r,
            top: 5.r,
            child: Icon(
              Icons.play_arrow,
              size: 25.w,
              color: context.colors.onPrimary.withValues(alpha: 0.5)
            )
          )
        ]
      )
    );
}