import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import 'package:fsi/core/router/app_router.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_search_bar.dart';
import 'package:fsi/core/widgets/no_data_label.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/app_list_tile.dart';
import 'package:fsi/core/widgets/app_image.dart';
import '../controllers/profile_list_controller.dart';
import 'profile_detail_screen.dart';

class ProfileListScreen extends StatelessWidget {
  static const String path = '/profile-list';
  
  const ProfileListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = profileListControllerProvider;
    return AppScaffoldChild(
      appNavBar: AppNavBar(
        title: Consumer(
          builder: (context, ref, _) =>
            AppSearchBar(
              placeholder: 'Search for users',
              onChanged: ref.read(profileListControllerProvider.notifier).updateSearchQuery
            )
        )
      ),
      appBody: Consumer(
        builder: (context, ref, _) =>
          _ListWidget(
            items: ref.watch(provider).value,
            onItemPressed: (profileId) =>
              context.push('${context.rootPath}/${ProfileDetailScreen.path}/$profileId')
          )
      )
    );
  }
}

class _ListWidget extends StatelessWidget {
  final List<ProfileEntity>? items;
  final Function(String) onItemPressed;

  const _ListWidget({
    required this.items,
    required this.onItemPressed
  });

  @override
  Widget build(BuildContext context) =>
    items != null ?
      items!.isNotEmpty ?
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: items!.length,
          itemBuilder: (_, index) =>
            _ItemWidget(
              items![index],
              onPressed: () =>
                onItemPressed(items![index].id)
            )
        ) :
        NoDataLabel('No Users Yet') :
      Container();
}

class _ItemWidget extends StatelessWidget {
  final ProfileEntity item;
  final Function() onPressed;

  const _ItemWidget(
    this.item, {
      required this.onPressed
  });

  @override
  Widget build(BuildContext context) =>
    AppListTile(
      height: 65.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      leading: Container(
        margin: EdgeInsets.only(right: 15.w),
        child: AppAvatar(
          item.avatarUrl,
          size: 50.w
        )
      ),
      title: Text(
        item.username,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: context.colors.onSurface
        )
      ),
      onPressed: onPressed
    );
}