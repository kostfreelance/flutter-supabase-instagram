import 'package:fsi/core/entities/profile_entity.dart';

abstract class FollowRepository {
  Stream<List<ProfileEntity>> watchFollowers(String profileId);
  Stream<List<ProfileEntity>> watchFollowing(String profileId);
  Future<bool> isFollowing(String profileId);
  Future<void> follow(String profileId);
  Future<void> unfollow(String profileId);
}