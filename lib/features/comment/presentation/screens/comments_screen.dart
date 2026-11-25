import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/router/app_router.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_image.dart';
import 'package:fsi/core/widgets/app_button.dart';
import 'package:fsi/core/widgets/no_data_label.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/infinity_list_view.dart';
import 'package:fsi/core/widgets/app_text_field.dart';
import 'package:fsi/features/profile/presentation/screens/profile_detail_screen.dart';
import '../../domain/entities/comment_entity.dart';
import '../controllers/comments_controller.dart';

class CommentsScreen extends StatelessWidget {
  static const String path = 'comments';
  final String postId;

  const CommentsScreen({
    super.key,
    required this.postId
  });

  @override
  Widget build(BuildContext context) {
    final provider = commentsControllerProvider(postId);
    return AppScaffold(
      appNavBar: AppNavBar(
        leftButton: AppNavBarBackButton(onPressed: context.pop),
        title: const AppNavBarTitle('Comments')
      ),
      appBody: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, _) =>
                _ListWidget(
                  hasMore: ref.watch(provider.select((s) => s.value?.hasMore)),
                  items: ref.watch(provider.select((s) => s.value?.comments)),
                  fetchNextItems: ref.read(provider.notifier).fetchNextComments,
                  onProfilePressed: (profileId) =>
                    context.push('${context.rootPath}/${ProfileDetailScreen.path}/$profileId')
                )
            )
          ),
          Consumer(
            builder: (context, ref, _) =>
              _BottomBarWidget(
                isCommentValid: ref.watch(provider.select((s) => s.value?.isCommentValid)),
                onCommentChanged: ref.read(provider.notifier).onCommentChanged,
                onPostPressed: ref.read(provider.notifier).onPostPressed
              )
          )
        ]
      )
    );
  }
}

class _ListWidget extends StatelessWidget {
  final bool? hasMore;
  final List<CommentEntity>? items;
  final Function() fetchNextItems;
  final Function(String) onProfilePressed;

  const _ListWidget({
    required this.hasMore,
    required this.items,
    required this.fetchNextItems,
    required this.onProfilePressed
  });

  @override
  Widget build(BuildContext context) =>
    hasMore != null && items != null ?
      items!.isNotEmpty ?
        InfinityListView<CommentEntity>(
          hasMore: hasMore!,
          itemWidget: (items, index) {
            final item = items[index];
            return _ItemWidget(
              item: item,
              onProfilePressed: () =>
                onProfilePressed(item.profile.id)
            );
          },
          items: items!,
          onLoadMore: fetchNextItems
        ) :
        const NoDataLabel('No Comments Yet') :
      Container();
}

class _ItemWidget extends StatelessWidget {
  final CommentEntity item;
  final Function() onProfilePressed;

  const _ItemWidget({
    required this.item,
    required this.onProfilePressed
  });

  @override
  Widget build(BuildContext context) =>
    Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onProfilePressed,
            child: AppAvatar(
              item.profile.avatarUrl,
              size: 40.w
            )
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
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
                        text: ' ${item.content}',
                        style: const TextStyle(fontWeight: FontWeight.normal)
                      )
                    ]
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  child: Text(
                    timeago.format(item.createdAt),
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: context.colors.onSurfaceVariant
                    )
                  )
                )
              ]
            )
          )
        ]
      )
    );
}

class _BottomBarWidget extends StatefulWidget {
  final bool? isCommentValid;
  final Function(String) onCommentChanged;
  final Function() onPostPressed;

  const _BottomBarWidget({
    required this.isCommentValid,
    required this.onCommentChanged,
    required this.onPostPressed
  });

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<_BottomBarWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
    widget.isCommentValid != null ?
      Container(
        width: AppScreenUtil.screenWidth,
        margin: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: context.colors.outline)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppTextField(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 12.w
                ),
                autofocus: true,
                maxLines: null,
                hintText: 'Add a comment...',
                controller: _controller,
                onChanged: widget.onCommentChanged
              )
            ),
            AppButton(
              borderRadius: BorderRadius.circular(20.r),
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 12.w
              ),
              onPressed: widget.isCommentValid! ?
                () {
                  _controller.text = '';
                  widget.onPostPressed();
                } : null,
              child: Text(
                'Post',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  color: context.colors.primary
                )
              )
            )
          ]
        )
      ) :
      Container();
}