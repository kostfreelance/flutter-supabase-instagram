import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import '../../data/repositories/follow_repository_impl.dart';

part 'following_controller.g.dart';

@riverpod
class FollowingController extends _$FollowingController {
  @override
  Stream<List<ProfileEntity>> build(String profileId) =>
    ref.watch(followRepositoryProvider).watchFollowing(profileId);
}