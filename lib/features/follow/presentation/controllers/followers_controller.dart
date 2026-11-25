import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import '../../data/repositories/follow_repository_impl.dart';

part 'followers_controller.g.dart';

@riverpod
class FollowersController extends _$FollowersController {
  @override
  Stream<List<ProfileEntity>> build(String profileId) =>
    ref.watch(followRepositoryProvider).watchFollowers(profileId);
}