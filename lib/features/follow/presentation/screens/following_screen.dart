import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/router/app_router.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/features/profile/presentation/screens/profile_detail_screen.dart';
import '../controllers/following_controller.dart';
import '../widgets/list_widget.dart';

class FollowingScreen extends StatelessWidget {
  static const String path = 'following';
  final String profileId;

  const FollowingScreen({
    super.key,
    required this.profileId
  });

  @override
  Widget build(BuildContext context) {
    final provider = followingControllerProvider(profileId);
    return AppScaffold(
      appNavBar: AppNavBar(
        leftButton: AppNavBarBackButton(onPressed: context.pop),
        title: Consumer(
          builder: (context, ref, _) {
            final profileCount = ref.watch(provider.select((s) => s.value?.length));
            return profileCount != null ?
              AppNavBarTitle('$profileCount Following') :
              Container();
          }
        )
      ),
      appBody: Consumer(
        builder: (context, ref, _) =>
          ListWidget(
            noDataLabel: 'No Following Yet',
            items: ref.watch(provider).value,
            onItemPressed: (profileId) =>
              context.push('${context.rootPath}/${ProfileDetailScreen.path}/$profileId')
          )
      )
    );
  }
}