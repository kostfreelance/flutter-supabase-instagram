import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/models/app_file.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/app_button.dart';
import 'package:fsi/core/widgets/app_progress_loader.dart';
import 'package:fsi/core/widgets/app_video_player.dart';
import 'package:fsi/core/widgets/app_text_field.dart';
import '../controllers/post_add_controller.dart';

class PostAddScreen extends StatelessWidget {
  static const String path = '/post-add';
  final String fileType;
  final String filePath;

  const PostAddScreen({
    super.key,
    required this.fileType,
    required this.filePath
  });

  @override
  Widget build(BuildContext context) {
    final file = AppFile(type: fileType, path: filePath);
    final provider = postAddControllerProvider(file);
    return AppScaffold(
      appNavBar: AppNavBar(
        leftButton: AppNavBarBackButton(onPressed: context.pop),
        title: const AppNavBarTitle('New Post'),
        rightButton: Consumer(
          builder: (context, ref, _) =>
            AppButton(
              width: 84.w,
              height: 50.w,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              onPressed: ref.watch(provider.select((s) => s.isValid)) ?
                () async {
                  AppProgressLoader.open(context);
                  await ref.read(provider.notifier).onSharePressed(onProgress: AppProgressLoader.update);
                  if (!context.mounted) return;
                  AppProgressLoader.close(context);
                  context.pop();
                } : null,
              child: Text(
                'Share',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary
                )
              )
            )
        )
      ),
      appBody: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15.r),
            child: switch (file.type) {
              AppFileType.image =>
                Image.file(
                  file.content,
                  width: 70.w,
                  height: 70.w,
                  fit: BoxFit.cover
                ),
              AppFileType.video =>
                AppVideoPlayer.file(
                  file.content,
                  width: 70.w,
                  height: 70.w
                )
            }
          ),
          Expanded(
            child: Consumer(
              builder: (context, ref, _) =>
                AppTextField(
                  padding: EdgeInsets.only(
                    top: 15.w,
                    right: 15.w,
                    bottom: 15.w
                  ),
                  autofocus: true,
                  maxLines: null,
                  hintText: 'Write a caption...',
                  onChanged: ref.read(provider.notifier).onCaptionChanged
                )
            )
          )
        ]
      )
    );
  }
}