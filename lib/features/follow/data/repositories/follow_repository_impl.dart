import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import '../data_sources/follow_api_service.dart';
import '../../domain/repositories/follow_repository.dart';

part 'follow_repository_impl.g.dart';

@riverpod
FollowRepository followRepository(Ref ref) =>
  FollowRepositoryImpl(ref.watch(followApiServiceProvider));

class FollowRepositoryImpl implements FollowRepository {
  final FollowApiService _followApiService;
  const FollowRepositoryImpl(this._followApiService);

  @override
  Stream<List<ProfileEntity>> watchFollowers(String profileId) {
    return _followApiService.watchFollowers(profileId)
      .map((es) => es.map((e) => e.toEntity()).toList());
  }

  @override
  Stream<List<ProfileEntity>> watchFollowing(String profileId) {
    return _followApiService.watchFollowing(profileId)
      .map((es) => es.map((e) => e.toEntity()).toList());
  }

  @override
  Future<bool> isFollowing(String profileId) {
    return _followApiService.isFollowing(profileId);
  }

  @override
  Future<void> follow(String profileId) {
    return _followApiService.follow(profileId);
  }

  @override
  Future<void> unfollow(String profileId) {
    return _followApiService.unfollow(profileId);
  }
}