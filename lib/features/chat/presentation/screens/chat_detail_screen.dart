import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import 'package:fsi/core/router/app_router.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_image.dart';
import 'package:fsi/core/widgets/app_button.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/infinity_list_view.dart';
import 'package:fsi/core/widgets/app_loader_indicator.dart';
import 'package:fsi/core/widgets/app_text_field.dart';
import 'package:fsi/features/profile/presentation/screens/profile_detail_screen.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../controllers/chat_detail_controller.dart';

class ChatDetailScreen extends StatefulWidget {
  static const String path = 'chat-detail';
  final String profileId;

  const ChatDetailScreen({super.key, required this.profileId});

  @override
  ChatDetailScreenState createState() => ChatDetailScreenState();
}

class ChatDetailScreenState extends State<ChatDetailScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = chatDetailControllerProvider(widget.profileId);
    return AppScaffold(
      appNavBar: AppNavBar(
        leftButton: AppNavBarBackButton(onPressed: context.pop),
        title: Consumer(
          builder: (context, ref, _) =>
            _AppNavBarTitleWidget(
              profile: ref.watch(provider.select((s) => s.value?.profile)),
              onPressed: (profileId) =>
                context.push('${context.rootPath}/${ProfileDetailScreen.path}/$profileId')
            )
        )
      ),
      appBody: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                ref.listen(
                  provider.select((s) => s.value?.chatMessages),
                  (prev, next) {
                    if (
                      _scrollController.hasClients &&
                      prev != null && 
                      next != null && 
                      prev.length >= next.length
                    ) {
                      _scrollController.jumpTo(0);
                    }
                  }
                );
                return _ListWidget(
                  hasMore: ref.watch(provider.select((s) => s.value?.hasMore)),
                  currentProfileId: ref.watch(provider.select((s) => s.value?.currentProfileId)),
                  items: ref.watch(provider.select((s) => s.value?.chatMessages)),
                  fetchNextItems: ref.read(provider.notifier).fetchNextMessages,
                  controller: _scrollController
                );
              }
            )
          ),
          Consumer(
            builder: (context, ref, _) =>
              _BottomBarWidget(
                isMessageValid: ref.watch(provider.select((s) => s.value?.isMessageValid)),
                onMessageChanged: ref.read(provider.notifier).onMessageChanged,
                onSendPressed: ref.read(provider.notifier).onSendPressed
              )
          )
        ]
      )
    );
  }
}

class _AppNavBarTitleWidget extends StatelessWidget {
  final ProfileEntity? profile;
  final Function(String) onPressed;

  const _AppNavBarTitleWidget({
    required this.profile,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) =>
    profile != null ?
      GestureDetector(
        child: SizedBox(
          width: AppScreenUtil.screenWidth / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAvatar(
                profile!.avatarUrl,
                size: 32.w
              ),
              SizedBox(width: 10.w),
              Text(
                profile!.username,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colors.onSurface
                )
              )
            ]
          )
        ),
        onTap: () =>
          onPressed(profile!.id)
      ) :
      Container();
}

class _ListWidget extends StatelessWidget {
  final bool? hasMore;
  final String? currentProfileId;
  final List<ChatMessageEntity>? items;
  final Function() fetchNextItems;
  final ScrollController controller;

  const _ListWidget({
    required this.hasMore,
    required this.currentProfileId,
    required this.items,
    required this.fetchNextItems,
    required this.controller
  });

  @override
  Widget build(BuildContext context) =>
    hasMore != null && currentProfileId != null && items != null ?
      items!.isNotEmpty ?
        InfinityListView<ChatMessageEntity>(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          reverse: true,
          hasMore: hasMore!,
          itemWidget: (items, index) {
            final item = items[index];
            return _ItemWidget(
              content: item.content,
              createdAt: index == (items.length - 1) ||
                (index > 0 && item.profileId != items[index + 1].profileId) ?
                items[index].createdAt : null,
              isCurrent: item.profileId == currentProfileId,
              withoutTopBorders: index < (items.length - 1) &&
                item.profileId == items[index + 1].profileId,
              withoutBottomBorders: index > 0 &&
                items[index].profileId == items[index - 1].profileId
            );
          },
          items: items!,
          controller: controller,
          onLoadMore: fetchNextItems
        ) :
        Container() :
      const AppLoaderIndicator();
}

class _ItemWidget extends StatelessWidget {
  final String content;
  final DateTime? createdAt;
  final bool isCurrent;
  final bool withoutTopBorders;
  final bool withoutBottomBorders;

  const _ItemWidget({
    required this.content,
    required this.createdAt,
    required this.isCurrent,
    required this.withoutTopBorders,
    required this.withoutBottomBorders
  });

  @override
  Widget build(BuildContext context) =>
    Column(
      children: [
        if (createdAt != null)
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              timeago.format(createdAt!),
              style: TextStyle(
                fontSize: 14.sp,
                color: context.colors.onSurfaceVariant
              )
            )
          ),
        Align(
          alignment: isCurrent ?
            Alignment.centerRight :
            Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(bottom: 8.h),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 8.w
            ),
            constraints: BoxConstraints(maxWidth: (AppScreenUtil.screenWidth - 60.w) * 0.7),
            decoration: BoxDecoration(
              color: isCurrent ?
                context.colors.primary :
                context.colors.outline,
              borderRadius: BorderRadius.only(
                topLeft: withoutTopBorders ?
                  isCurrent ? Radius.circular(10.r) : Radius.zero :
                  Radius.circular(10.r),
                topRight: withoutTopBorders ?
                  isCurrent ? Radius.zero : Radius.circular(10.r) :
                  Radius.circular(10.r),
                bottomLeft: withoutBottomBorders ?
                  isCurrent ? Radius.circular(10.r) : Radius.zero :
                  Radius.circular(10.r),
                bottomRight: withoutBottomBorders ?
                  isCurrent ? Radius.zero : Radius.circular(10.r) :
                  Radius.circular(10.r)
              )
            ),
            child: Text(
              content,
              textWidthBasis: TextWidthBasis.longestLine,
              style: TextStyle(
                fontSize: 16.sp,
                color: isCurrent ?
                  context.colors.onPrimary :
                  context.colors.onSurface
              )
            )
          )
        )
      ]
    );
}

class _BottomBarWidget extends StatefulWidget {
  final bool? isMessageValid;
  final Function(String) onMessageChanged;
  final Function() onSendPressed;

  const _BottomBarWidget({
    required this.isMessageValid,
    required this.onMessageChanged,
    required this.onSendPressed
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
    widget.isMessageValid != null ?
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
                maxLines: null,
                hintText: 'Message...',
                controller: _controller,
                onChanged: widget.onMessageChanged
              )
            ),
            AppButton(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 12.w
              ),
              borderRadius: BorderRadius.circular(20.r),
              onPressed: widget.isMessageValid! ?
                () {
                  _controller.text = '';
                  widget.onSendPressed();
                } : null,
              child: Text(
                'Send',
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