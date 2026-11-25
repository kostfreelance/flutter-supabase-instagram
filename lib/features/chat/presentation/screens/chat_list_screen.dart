import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/router/app_router.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_search_bar.dart';
import 'package:fsi/core/widgets/no_data_label.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/app_list_tile.dart';
import 'package:fsi/core/widgets/confirm_alert.dart';
import 'package:fsi/core/widgets/app_loader.dart';
import 'package:fsi/core/widgets/app_image.dart';
import '../../domain/entities/chat_entity.dart';
import '../controllers/chat_list_controller.dart';
import 'chat_detail_screen.dart';

class ChatListScreen extends StatelessWidget {
  static const String path = '/chat-list';

  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = chatListControllerProvider;
    return AppScaffoldChild(
      appNavBar: AppNavBar(
        title: Consumer(
          builder: (context, ref, _) =>
            AppSearchBar(
              placeholder: 'Search for chats',
              onChanged: ref.read(provider.notifier).updateSearchQuery
            )
          )
      ),
      appBody: Consumer(
        builder: (context, ref, _) =>
          _ListWidget(
            items: ref.watch(provider).value,
            onItemPressed: (profileId) =>
              context.push('${context.rootPath}/${ChatDetailScreen.path}/$profileId'),
            onDeletePressed: (chatId) =>
              ConfirmAlert.open(
                context,
                title: 'Are you sure you want to delete this chat?',
                onConfirmPressed: () async {
                  AppLoader.open(context);
                  await ref.read(provider.notifier).onDeletePressed(chatId);
                  if (!context.mounted) return;
                  AppLoader.close(context);
                }
              )
          )
      )
    );
  }
}

class _ListWidget extends StatelessWidget {
  final List<ChatEntity>? items;
  final Function(String) onItemPressed;
  final Function(String) onDeletePressed;

  const _ListWidget({
    required this.items,
    required this.onItemPressed,
    required this.onDeletePressed
  });

  @override
  Widget build(BuildContext context) =>
    items != null ?
      items!.isNotEmpty ?
        ListView.builder(
          padding: EdgeInsets.only(top: 7.5.w),
          itemCount: items!.length,
          itemBuilder: (_, index) {
            final item = items![index];
            return _ItemWidget(
              item: item,
              onPressed: () =>
                onItemPressed(item.profile.id),
              onRemovePressed: () =>
                onDeletePressed(item.id)
            );
          }
        ) :
        const NoDataLabel('No Chats Yet') :
      Container();
}

class _ItemWidget extends StatelessWidget {
  final ChatEntity item;
  final Function() onPressed;
  final Function() onRemovePressed;

  const _ItemWidget({
    required this.item,
    required this.onPressed,
    required this.onRemovePressed
  });

  @override
  Widget build(BuildContext context) =>
    SizedBox(
      height: 65.w,
      child: Slidable(
        key: ValueKey(item.id),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              backgroundColor: context.colors.error,
              foregroundColor: context.colors.onPrimary,
              icon: Icons.delete_outline,
              onPressed: (context) {
                Slidable.of(context)?.close();
                onRemovePressed();
              }
            )
          ],
        ),
        child: AppListTile(
          height: 50.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          leading: Container(
            margin: EdgeInsets.only(right: 15.w),
            child: AppAvatar(
              item.profile.avatarUrl,
              size: 50.w
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
          subTitle: Row(
            children: [
              Flexible(
                child: Text(
                  item.lastChatMessage?.content ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: context.colors.onSurfaceVariant
                  )
                )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 2.w,
                height: 2.w,
                decoration: BoxDecoration(
                  color: context.colors.onSurfaceVariant,
                  shape: BoxShape.circle
                ),
              ),
              Flexible(
                child: Text(
                  item.lastChatMessage != null ?
                    timeago.format(item.lastChatMessage!.createdAt) :
                    '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: context.colors.outline
                  )
                )
              )
            ]
          ),
          trailing: Container(
            margin: EdgeInsets.only(left: 15.w),
            child: item.hasUnread ?
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  shape: BoxShape.circle
                ),
              ) :
              Container()
          ),
          onPressed: onPressed
        )
      )
    );
}