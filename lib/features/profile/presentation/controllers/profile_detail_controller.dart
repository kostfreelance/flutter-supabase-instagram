import 'package:rxdart/rxdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import 'package:fsi/features/post/domain/entities/post_entity.dart';
import 'package:fsi/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fsi/features/follow/data/repositories/follow_repository_impl.dart';
import 'package:fsi/features/post/data/repositories/post_repository_impl.dart';
import '../../data/repositories/profile_repository_impl.dart';

part 'profile_detail_controller.g.dart';
part 'profile_detail_controller.freezed.dart';

@freezed
abstract class ProfileDetailState with _$ProfileDetailState {
  const factory ProfileDetailState({
    required String currentProfileId,
    required ProfileEntity profile,
    required List<PostEntity> posts,
    required bool isFollowing
  }) = _ProfileDetailState;
}

@riverpod
class ProfileDetailController extends _$ProfileDetailController {
  @override
  Stream<ProfileDetailState> build(String? profileId) {
    String currentProfileId = ref.watch(authRepositoryProvider).fetchCurrentProfileId();
    profileId = profileId ?? currentProfileId;
    return Rx.combineLatest2(
      ref.watch(profileRepositoryProvider).watchProfile(profileId),
      ref.watch(postRepositoryProvider).watchPostsByProfileId(profileId),
      (profile, posts) => (profile, posts)
    ).asyncMap((res) async {
      bool isFollowing = profileId != currentProfileId &&
        await ref.watch(followRepositoryProvider).isFollowing(profileId!);
      return ProfileDetailState(
        currentProfileId: currentProfileId,
        profile: res.$1,
        posts: res.$2,
        isFollowing: isFollowing
      );
    });
  }

  void onFollowPressed() async {
    final prevState = state.requireValue;
    if (prevState.isFollowing) {
      await ref.read(followRepositoryProvider).unfollow(prevState.profile.id);
    } else {
      await ref.read(followRepositoryProvider).follow(prevState.profile.id);
    }
    state = AsyncData(prevState.copyWith(isFollowing: !prevState.isFollowing));
  }

  void onLogoutPressed() async {
    await ref.watch(authRepositoryProvider).logout();
  }
}