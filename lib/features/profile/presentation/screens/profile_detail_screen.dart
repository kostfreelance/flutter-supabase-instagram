import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import 'package:fsi/core/router/app_router.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_image.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/app_button.dart';
import 'package:fsi/core/widgets/confirm_alert.dart';
import 'package:fsi/core/widgets/no_data_label.dart';
import 'package:fsi/features/post/domain/entities/post_entity.dart';
import 'package:fsi/features/follow/presentation/screens/following_screen.dart';
import 'package:fsi/features/follow/presentation/screens/followers_screen.dart';
import 'package:fsi/features/chat/presentation/screens/chat_detail_screen.dart';
import 'package:fsi/features/post/presentation/screens/post_detail_screen.dart';
import '../controllers/profile_detail_controller.dart';
import 'profile_edit_screen.dart';

class ProfileDetailScreen extends StatelessWidget {
  static const String path = 'profile-detail';
  final String? profileId;

  const ProfileDetailScreen({
    super.key,
    this.profileId
  });

  @override
  Widget build(BuildContext context) {
    final provider = profileDetailControllerProvider(profileId);
    final appNavBar = AppNavBar(
      leftButton: profileId != null ?
        AppNavBarBackButton(onPressed: context.pop) : null,
      title: Consumer(
        builder: (context, ref, _) {
          final profile = ref.watch(provider.select((s) => s.value?.profile));
          return profile != null ?
            AppNavBarTitle(profile.username) :
            Container();
        }
      )
    );
    final appBody = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, _) =>
            _ProfileWidget(
              currentProfileId: ref.watch(provider.select((s) => s.value?.currentProfileId)),
              isFollowing: ref.watch(provider.select((s) => s.value?.isFollowing)),
              profile: ref.watch(provider.select((s) => s.value?.profile)),
              onFollowersPressed: (profileId) =>
                context.push('${context.rootPath}/${FollowersScreen.path}/$profileId'),
              onFollowingPressed: (profileId) =>
                context.push('${context.rootPath}/${FollowingScreen.path}/$profileId'),
              onEditProfilePressed: (profileId) =>
                context.push('${context.rootPath}/${ProfileEditScreen.path}/$profileId'),
              onFollowPressed: ref.read(provider.notifier).onFollowPressed,
              onLogoutPressed: () =>
                ConfirmAlert.open(
                  context,
                  title: 'Are you sure you want to logout?',
                  onConfirmPressed: ref.read(provider.notifier).onLogoutPressed
                ),
              onMessagePressed: (profileId) =>
                context.push('${context.rootPath}/${ChatDetailScreen.path}/$profileId')
            )
        ),
        Consumer(
          builder: (context, ref, _) =>
            _PostListWidget(
              items: ref.watch(provider.select((s) => s.value?.posts)),
              onItemPressed: (postId) =>
                context.push('${context.rootPath}/${PostDetailScreen.path}/$postId')
            )
        )
      ]
    );
    return profileId != null ?
      AppScaffold(
        appNavBar: appNavBar,
        appBody: appBody
      ) :
      AppScaffoldChild(
        appNavBar: appNavBar,
        appBody: appBody
      );
  }
}

class _ProfileWidget extends StatelessWidget {
  final String? currentProfileId;
  final bool? isFollowing;
  final ProfileEntity? profile;
  final Function(String) onFollowersPressed;
  final Function(String) onFollowingPressed;
  final Function(String) onEditProfilePressed;
  final Function() onFollowPressed;
  final Function() onLogoutPressed;
  final Function(String) onMessagePressed;

  const _ProfileWidget({
    required this.currentProfileId,
    required this.isFollowing,
    required this.profile,
    required this.onFollowersPressed,
    required this.onFollowingPressed,
    required this.onEditProfilePressed,
    required this.onFollowPressed,
    required this.onLogoutPressed,
    required this.onMessagePressed
  });

  @override
  Widget build(BuildContext context) =>
    profile != null &&
    isFollowing != null &&
    currentProfileId != null ?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 15.w,
              top: 15.h,
              right: 15.w
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppAvatar(
                  profile!.avatarUrl,
                  size: 90.w
                ),
                _ProfileCountWidget(
                  label: 'Posts',
                  value: profile!.postCount
                ),
                AppButton(
                  child: _ProfileCountWidget(
                    label: 'Followers',
                    value: profile!.followerCount
                  ),
                  onPressed: () =>
                    onFollowersPressed(profile!.id)
                ),
                AppButton(
                  child: _ProfileCountWidget(
                    label: 'Following',
                    value: profile!.followingCount
                  ),
                  onPressed: () =>
                    onFollowingPressed(profile!.id)
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.all(15.r),
            child: Text(
              profile!.username,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                profile!.id == currentProfileId! ?
                  _ProfileButtonWidget(
                    text: 'Edit Profile',
                    onPressed: () =>
                      onEditProfilePressed(profile!.id)
                  ) :
                  _ProfileButtonWidget(
                    textColor: isFollowing! ?
                      context.colors.onSurface :
                      context.colors.onPrimary,
                    backgroundColor: isFollowing! ?
                      context.colors.onPrimary :
                      context.colors.primary,
                    text: isFollowing! ?
                      'Unfollow' : 'Follow',
                    onPressed: onFollowPressed
                  ),
                profile!.id == currentProfileId! ?
                  _ProfileButtonWidget(
                    text: 'Logout',
                    onPressed: onLogoutPressed
                  ) :
                  _ProfileButtonWidget(
                    text: 'Message',
                    onPressed: () =>
                      onMessagePressed(profile!.id)
                  )
              ]
            )
          )
        ]
      ) :
      Container();
}

class _ProfileCountWidget extends StatelessWidget {
  final String label;
  final int value;

  const _ProfileCountWidget({
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) =>
    Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: context.colors.onSurface
          )
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: context.colors.onSurface
          )
        )
      ]
    );
}

class _ProfileButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Function() onPressed;

  const _ProfileButtonWidget({
    this.backgroundColor,
    this.textColor,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) =>
    AppButton(
      width: AppScreenUtil.screenWidth / 2 - 20.w,
      height: 34.w,
      border: Border.all(color: context.colors.outline),
      borderRadius: BorderRadius.circular(6.r),
      backgroundColor: backgroundColor ?? context.colors.onPrimary,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: textColor ?? context.colors.onSurface
        )
      )
    );
}

class _PostListWidget extends StatelessWidget {
  final List<PostEntity>? items;
  final Function(String) onItemPressed;

  const _PostListWidget({
    required this.items,
    required this.onItemPressed
  });

  @override
  Widget build(BuildContext context) =>
    Expanded(
      child: items != null ?
        items!.isNotEmpty ?
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1
            ),
            itemCount: items!.length,
            itemBuilder: (_, index) {
              final post = items![index];
              return GestureDetector(
                onTap: () =>
                  onItemPressed(post.id),
                child: post.thumbUrl != null ?
                  AppThumb(post.thumbUrl!) :
                  AppImage.network(post.fileUrl)
              );
            }
          ) :
          const NoDataLabel('No Posts Yet') :
        Container()
    );
}