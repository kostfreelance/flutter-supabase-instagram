import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/config/app_config.dart';
import 'package:fsi/core/router/app_router.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_image.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/app_button.dart';
import 'package:fsi/core/widgets/app_list_tile.dart';
import 'package:fsi/core/widgets/app_video_player.dart';
import 'package:fsi/core/widgets/confirm_alert.dart';
import 'package:fsi/core/widgets/app_loader.dart';
import 'package:fsi/features/comment/domain/entities/comment_entity.dart';
import 'package:fsi/features/comment/presentation/screens/comments_screen.dart';
import 'package:fsi/features/profile/presentation/screens/profile_detail_screen.dart';
import '../../domain/entities/post_entity.dart';
import '../controllers/post_detail_controller.dart';

class PostDetailScreen extends StatelessWidget {
  static const String path = 'post-detail';
  final String postId;

  const PostDetailScreen({
    super.key,
    required this.postId
  });

  @override
  Widget build(BuildContext context) {
    final provider = postDetailControllerProvider(postId);
    return AppScaffold(
      appNavBar: AppNavBar(
        leftButton: AppNavBarBackButton(onPressed: context.pop),
        title: Text(
          AppConfig.appName,
          style: TextStyle(
            fontFamily: 'Cookie-Regular',
            fontSize: 35.sp,
            color: context.colors.onSurface
          )
        )
      ),
      appBody: Consumer(
        builder: (context, ref, _) =>
          _PostWidget(
            currentProfileId: ref.watch(provider.select((s) => s.value?.currentProfileId)),
            post: ref.watch(provider.select((s) => s.value?.post)),
            comments: ref.watch(provider.select((s) => s.value?.comments)),
            maxCommentCount: ref.read(provider.notifier).maxCommentCount,
            onLikePressed: ref.read(provider.notifier).onLikePressed,
            onSharePressed: (fileUrl) =>
              SharePlus.instance.share(
                ShareParams(
                  text: '${AppConfig.appName} $fileUrl',
                  sharePositionOrigin: const Rect.fromLTWH(0, 0, 1, 1)
                )
              ),
            onDeletePressed: () =>
              ConfirmAlert.open(
                context,
                title: 'Are you sure you want to delete this post?',
                onConfirmPressed: () async {
                  AppLoader.open(context);
                  await ref.read(provider.notifier).onDeletePressed();
                  if (!context.mounted) return;
                  AppLoader.close(context);
                  context.pop();
                }
              ),
            onProfilePressed: (profileId) =>
              context.push('${context.rootPath}/${ProfileDetailScreen.path}/$profileId'),
            onCommentsPressed: (postId) =>
              context.push('${context.rootPath}/${CommentsScreen.path}/$postId')
          )
      )
    );
  }
}

class _PostWidget extends StatelessWidget {
  final String? currentProfileId;
  final PostEntity? post;
  final List<CommentEntity>? comments;
  final int maxCommentCount;
  final Function() onLikePressed;
  final Function(String) onSharePressed;
  final Function() onDeletePressed;
  final Function(String) onProfilePressed;
  final Function(String) onCommentsPressed;

  const _PostWidget({
    required this.currentProfileId,
    required this.post,
    required this.comments,
    required this.maxCommentCount,
    required this.onLikePressed,
    required this.onSharePressed,
    required this.onDeletePressed,
    required this.onProfilePressed,
    required this.onCommentsPressed
  });

  @override
  Widget build(BuildContext context) =>
    currentProfileId != null && post != null && comments != null ?
      ListView(
        padding: EdgeInsets.zero,
        children: [
          AppListTile(
            height: 48.w,
            leading: Container(
              margin: EdgeInsets.only(
                left: 15.w,
                right: 12.w
              ),
              child: AppAvatar(
                post!.profile.avatarUrl,
                size: 30.w
              )
            ),
            title: Text(
              post!.profile.username,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: context.colors.onSurface
              )
            ),
            trailing: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                timeago.format(post!.createdAt),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.colors.onSurfaceVariant
                )
              )
            ),
            onPressed: () =>
              onProfilePressed(post!.profile.id)
          ),
          post!.thumbUrl != null ?
            AppVideoPlayer.network(
              post!.fileUrl,
              width: AppScreenUtil.screenWidth,
              height: AppScreenUtil.screenWidth
            ) :
            AppImage.network(
              post!.fileUrl,
              width: AppScreenUtil.screenWidth,
              height: AppScreenUtil.screenWidth
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppButton(
                    height: 48.w,
                    padding: EdgeInsets.only(
                      left: 13.w,
                      right: 6.5.w
                    ),
                    onPressed: onLikePressed,
                    child: Icon(
                      post!.isLiked ?
                        Icons.favorite :
                        Icons.favorite_border,
                      size: 28.w,
                      color: post!.isLiked ?
                        context.colors.error :
                        context.colors.onSurface
                    )
                  ),
                  AppButton(
                    height: 48.w,
                    padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                    onPressed: () =>
                      onCommentsPressed(post!.id),
                    child: Icon(
                      Icons.chat_bubble_outline,
                      size: 28.w,
                      color: context.colors.onSurface
                    )
                  ),
                  AppButton(
                    height: 48.w,
                    padding: EdgeInsets.only(
                      left: 6.5.w,
                      right: 13.w
                    ),
                    onPressed: () =>
                      onSharePressed(post!.fileUrl),
                    child: Icon(
                      Icons.share,
                      size: 28.w,
                      color: context.colors.onSurface
                    )
                  )
                ]
              ),
              post!.profile.id == currentProfileId! ?
                AppButton(
                  height: 48.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  onPressed: onDeletePressed,
                  child: Icon(
                    Icons.delete_outline,
                    size: 28.w,
                    color: context.colors.onSurface
                  )
                ) :
                Container()
            ]
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15.w,
              bottom: 10.h
            ),
            child: Text(
              post!.likeCount == 1 ?
                '1 like' :
                '${post!.likeCount.toString()} likes',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: context.colors.onSurface
              )
            )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: RichText(
              text: TextSpan(
                text: post!.profile.username,
                style: TextStyle(
                  fontFamily: 'Lato-Regular',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colors.onSurface
                ),
                children: [
                  TextSpan(
                    text: '  ${post!.caption}',
                    style: const TextStyle(fontWeight: FontWeight.normal)
                  )
                ]
              )
            )
          ),
          AppButton(
            padding: EdgeInsets.all(15.w),
            alignment: Alignment.centerLeft,
            onPressed: () =>
              onCommentsPressed(post!.id),
            child: Text(
              post!.commentCount > maxCommentCount ?
                'View all ${post!.commentCount.toString()} comments' :
                'Add a comment',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: context.colors.onSurfaceVariant
                )
            )
          ),
          _CommentListWidget(comments: comments!)
        ]
      ) :
    Container();
}

class _CommentListWidget extends StatelessWidget {
  final List<CommentEntity> comments;
  const _CommentListWidget({required this.comments});

  @override
  Widget build(BuildContext context) =>
    comments.isNotEmpty ?
      Container(
        margin: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          bottom: 5.h
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: comments.map((comment) =>
            _CommentItemWidget(comment: comment)
          ).toList()
        )
      ) :
      Container();
}

class _CommentItemWidget extends StatelessWidget {
  final CommentEntity comment;
  const _CommentItemWidget({required this.comment});

  @override
  Widget build(BuildContext context) =>
    Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: comment.profile.username,
              style: TextStyle(
                fontFamily: 'Lato-Regular',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: context.colors.onSurface
              ),
              children: [
                TextSpan(
                  text: ' ${comment.content}',
                  style: const TextStyle(fontWeight: FontWeight.normal)
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 3.h),
            child: Text(
              timeago.format(comment.createdAt),
              style: TextStyle(
                fontSize: 13.sp,
                color: context.colors.onSurfaceVariant
              )
            )
          )
        ]
      )
    );
}