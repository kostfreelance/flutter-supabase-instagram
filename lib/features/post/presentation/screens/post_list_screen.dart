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
import 'package:fsi/core/widgets/app_button.dart';
import 'package:fsi/core/widgets/no_data_label.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/app_list_tile.dart';
import 'package:fsi/core/widgets/confirm_alert.dart';
import 'package:fsi/core/widgets/infinity_list_view.dart';
import 'package:fsi/core/widgets/app_loader.dart';
import 'package:fsi/core/widgets/app_search_bar.dart';
import 'package:fsi/features/profile/presentation/screens/profile_detail_screen.dart';
import 'package:fsi/features/comment/presentation/screens/comments_screen.dart';
import '../../domain/entities/post_entity.dart';
import '../controllers/post_list_controller.dart';
import 'post_detail_screen.dart';

class PostListScreen extends StatelessWidget {
  static const String path = '/post-list';

  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = postListControllerProvider;
    return AppScaffoldChild(
      appNavBar: AppNavBar(
        title: Text(
          AppConfig.appName,
          style: TextStyle(
            fontFamily: 'Cookie-Regular',
            fontSize: 35.sp,
            color: context.colors.onSurface
          )
        ),
        rightButton: Consumer(
          builder: (context, ref, _) =>
            AppButton(
              width: AppNavBar.height,
              height: AppNavBar.height,
              onPressed: ref.read(provider.notifier).onSearchPressed,
              child: Icon(
                Icons.search,
                size: 24.w,
                color: context.colors.onSurface
              )
            )
        )
      ),
      appBody: Column(
        children: [
          Consumer(
            builder: (context, ref, _) =>
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                height: ref.watch(provider.select((s) => s.value?.isSearchOpen)) ?? false ?
                  AppNavBar.height : 0, 
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    height: AppNavBar.height,
                    child: Center(
                      child: AppSearchBar(
                        placeholder: 'Search for posts',
                        controller: ref.read(provider.notifier).searchController,
                        onChanged: ref.read(provider.notifier).updateSearchQuery
                      )
                    )
                  )
                )
              )
          ),
          Expanded(
            child: Consumer(
              builder: (context, ref, _) =>
                _ListWidget(
                  scrollController: ref.read(provider.notifier).scrollController,
                  currentProfileId: ref.watch(provider.select((s) => s.value?.currentProfileId)),
                  hasMore: ref.watch(provider.select((s) => s.value?.hasMore)),
                  items: ref.watch(provider.select((s) => s.value?.posts)),
                  onItemPressed: (postId) =>
                    context.push('${context.rootPath}/${PostDetailScreen.path}/$postId'),
                  fetchNextItems: ref.read(provider.notifier).fetchNextPosts,
                  onRefresh: ref.read(provider.notifier).initPosts,
                  onLikePressed: ref.read(provider.notifier).onLikePressed,
                  onSharePressed: (fileUrl) =>
                    SharePlus.instance.share(
                      ShareParams(
                        text: '${AppConfig.appName} $fileUrl',
                        sharePositionOrigin: const Rect.fromLTWH(0, 0, 1, 1)
                      )
                    ),
                  onDeletePressed: (postId) =>
                    ConfirmAlert.open(
                      context,
                      title: 'Are you sure you want to delete this post?',
                      onConfirmPressed: () async {
                        AppLoader.open(context);
                        await ref.read(provider.notifier).onDeletePressed(postId);
                        if (!context.mounted) return;
                        AppLoader.close(context);
                      }
                    ),
                  onProfilePressed: (profileId) =>
                    context.push('${context.rootPath}/${ProfileDetailScreen.path}/$profileId'),
                  onCommentsPressed: (postId) =>
                    context.push('${context.rootPath}/${CommentsScreen.path}/$postId')
                )
            )
          )
        ]
      )
    );
  }
}

class _ListWidget extends StatelessWidget {
  final ScrollController scrollController;
  final String? currentProfileId;
  final bool? hasMore;
  final List<PostEntity>? items;
  final Function(String) onItemPressed;
  final Function() fetchNextItems;
  final Future<void> Function() onRefresh;
  final Function(String) onLikePressed;
  final Function(String) onSharePressed;
  final Function(String) onDeletePressed;
  final Function(String) onProfilePressed;
  final Function(String) onCommentsPressed;

  const _ListWidget({
    required this.scrollController,
    required this.currentProfileId,
    required this.hasMore,
    required this.items,
    required this.onItemPressed,
    required this.fetchNextItems,
    required this.onRefresh,
    required this.onLikePressed,
    required this.onSharePressed,
    required this.onDeletePressed,
    required this.onProfilePressed,
    required this.onCommentsPressed
  });

  @override
  Widget build(BuildContext context) =>
    currentProfileId != null &&
    hasMore != null &&
    items != null ?
      RefreshIndicator(
        onRefresh: () async {
          await onRefresh();
          return Future.value();
        },
        child: items!.isNotEmpty ? 
          InfinityListView<PostEntity>(
            hasMore: hasMore!,
            itemWidget: (items, index) {
              final post = items[index];
              return _ItemWidget(
                isCurrent: post.profile.id == currentProfileId!,
                item: post,
                onPressed: () =>
                  onItemPressed(post.id),
                onLikePressed: () =>
                  onLikePressed(post.id),
                onSharePressed: () =>
                  onSharePressed(post.fileUrl),
                onDeletePressed: () =>
                  onDeletePressed(post.id),
                onProfilePressed: () =>
                  onProfilePressed(post.profile.id),
                onCommentsPressed: () =>
                  onCommentsPressed(post.id)
              );
            },
            items: items!,
            controller: scrollController,
            onLoadMore: fetchNextItems
          ) :
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: AppScreenUtil.screenWidth,
                  child: const NoDataLabel('No Posts Yet')
                )
              ]
            )
          )
      ) :
      Container();
}

class _ItemWidget extends StatelessWidget {
  final bool isCurrent;
  final PostEntity item;
  final Function() onPressed;
  final Function() onLikePressed;
  final Function() onSharePressed;
  final Function() onDeletePressed;
  final Function() onProfilePressed;
  final Function() onCommentsPressed;

  const _ItemWidget({
    required this.isCurrent,
    required this.item,
    required this.onPressed,
    required this.onLikePressed,
    required this.onSharePressed,
    required this.onDeletePressed,
    required this.onProfilePressed,
    required this.onCommentsPressed
  });

  @override
  Widget build(BuildContext context) {
    double previewWidth = AppScreenUtil.screenWidth;
    double previewHeight = AppScreenUtil.screenWidth / 1.5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppListTile(
          height: 48.w,
          leading: Container(
            margin: EdgeInsets.only(
              left: 15.w,
              right: 12.w
            ),
            child: AppAvatar(
              item.profile.avatarUrl,
              size: 30.w
            )
          ),
          title: Text(
            item.profile.username,
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
              timeago.format(item.createdAt),
              style: TextStyle(
                fontSize: 14.sp,
                color: context.colors.onSurfaceVariant
              )
            )
          ),
          onPressed: onProfilePressed
        ),
        GestureDetector(
          onTap: onPressed,
          child: item.thumbUrl != null ?
            AppThumb(
              item.thumbUrl!,
              width: previewWidth,
              height: previewHeight
            ) :
            AppImage.network(
              item.fileUrl,
              width: previewWidth,
              height: previewHeight
            )
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
                    item.isLiked ?
                      Icons.favorite :
                      Icons.favorite_border,
                    size: 28.w,
                    color: item.isLiked ?
                      context.colors.error :
                      context.colors.onSurface
                  )
                ),
                AppButton(
                  height: 48.w,
                  padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                  onPressed: onCommentsPressed,
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
                  onPressed: onSharePressed,
                  child: Icon(
                    Icons.share,
                    size: 28.w,
                    color: context.colors.onSurface
                  )
                )
              ]
            ),
            isCurrent ?
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
            item.likeCount == 1 ?
              '1 like' :
              '${item.likeCount.toString()} likes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: context.colors.onSurface
            )
          )
        ),
        Container(
          margin: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            bottom: 15.h
          ),
          child: RichText(
            text: TextSpan(
              text: item.profile.username,
              style: TextStyle(
                fontFamily: 'Lato-Regular',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: context.colors.onSurface
              ),
              children: [
                TextSpan(
                  text: '  ${item.caption}',
                  style: const TextStyle(fontWeight: FontWeight.normal)
                )
              ]
            )
          )
        )
      ]
    );
  }
}