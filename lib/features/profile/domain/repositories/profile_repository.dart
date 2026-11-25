import 'package:fsi/core/entities/profile_entity.dart';

abstract class ProfileRepository {
  Stream<List<ProfileEntity>> watchProfiles();
  Stream<ProfileEntity> watchProfile(String profileId);
  Future<ProfileEntity> fetchProfile(String profileId);
}