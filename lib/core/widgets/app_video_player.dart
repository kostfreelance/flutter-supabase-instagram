import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';
import 'app_button.dart';

class AppVideoPlayer extends StatefulWidget {
  final bool withControls;
  final double width;
  final double height;
  final VideoPlayerController controller;

  const AppVideoPlayer._({
    super.key,
    this.withControls = true,
    required this.width,
    required this.height,
    required this.controller
  });

  factory AppVideoPlayer.network(
    String url, {
      Key? key,
      required double width,
      required double height
  }) =>
    AppVideoPlayer._(
      key: key,
      width: width,
      height: height,
      controller: VideoPlayerController.networkUrl(Uri.parse(url))
    );

  factory AppVideoPlayer.file(
    File file, {
      Key? key,
      required double width,
      required double height
  }) =>
    AppVideoPlayer._(
      key: key,
      withControls: false,
      width: width,
      height: height,
      controller: VideoPlayerController.file(file)
    );

  @override
  AppVideoPlayerState createState() => AppVideoPlayerState();
}

class AppVideoPlayerState extends State<AppVideoPlayer> {
  void _togglePlayPause() {
    if (widget.controller.value.isPlaying) {
      widget.controller.pause();
    } else {
      widget.controller.play();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.controller.initialize().then((_) async {
      if (widget.withControls) {
        await widget.controller.play();
        await widget.controller.setLooping(true);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
    Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          color: context.colors.onSurface,
          child: widget.controller.value.isInitialized ?
            FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: widget.controller.value.size.width,
                height: widget.controller.value.size.height,
                child: VideoPlayer(widget.controller)
              )
            ) :
            Container()
        ),
        if (widget.withControls)
          Positioned(
            right: widget.width / 2 - 30.w,
            top: widget.height / 2 - 30.w,
            child: AppButton(
              onPressed: _togglePlayPause,
              child: Icon(
                widget.controller.value.isPlaying ?
                  Icons.pause :
                  Icons.play_arrow,
                size: 60.w,
                color: context.colors.onPrimary.withValues(alpha: 0.5)
              )
            )
          )
      ]
    );
}