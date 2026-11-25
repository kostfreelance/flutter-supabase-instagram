import 'package:flutter/material.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_image.dart';
import 'package:fsi/core/widgets/app_list_tile.dart';
import 'package:fsi/core/widgets/no_data_label.dart';

class ListWidget extends StatelessWidget {
  final String noDataLabel;
  final List<ProfileEntity>? items;
  final Function(String) onItemPressed;

  const ListWidget({
    super.key,
    required this.noDataLabel,
    required this.items,
    required this.onItemPressed
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
                onItemPressed(item.id)
            );
          }
        ) :
        NoDataLabel(noDataLabel) :
      Container();
}

class _ItemWidget extends StatelessWidget {
  final ProfileEntity item;
  final Function() onPressed;

  const _ItemWidget({
    required this.item,
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