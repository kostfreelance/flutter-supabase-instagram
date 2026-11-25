import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import '../data_sources/profile_api_service.dart';
import '../../domain/repositories/profile_repository.dart';

part 'profile_repository_impl.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) =>
  ProfileRepositoryImpl(ref.watch(profileApiServiceProvider));

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApiService _profileApiService;
  const ProfileRepositoryImpl(this._profileApiService);

  @override
  Stream<List<ProfileEntity>> watchProfiles() {
    return _profileApiService.watchProfiles()
      .map((es) => es.map((e) => e.toEntity()).toList());
  }

  @override
  Stream<ProfileEntity> watchProfile(String profileId) {
    return _profileApiService.watchProfile(profileId)
      .map((e) => e.toEntity());
  }

  @override
  Future<ProfileEntity> fetchProfile(String profileId) {
    return _profileApiService.fetchProfile(profileId)
      .then((e) => e.toEntity());
  }
}