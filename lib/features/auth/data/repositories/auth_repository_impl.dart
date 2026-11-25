import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/dtos/profile_dto.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import '../data_sources/auth_api_service.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_repository_impl.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) =>
  AuthRepositoryImpl(ref.watch(authApiServiceProvider));

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;
  const AuthRepositoryImpl(this._authApiService);

  @override
  Future<void> login(
    String email,
    String password
  ) {
    return _authApiService.login(email, password);
  }

  @override
  Future<void> register(
    String email,
    String username,
    String password
  ) {
    return _authApiService.register(email, username, password);
  }

  @override
  Future<void> logout() {
    return _authApiService.logout();
  }

  @override
  String fetchCurrentProfileId() {
    return _authApiService.fetchCurrentProfileId();
  }

  @override
  Future<ProfileEntity> fetchCurrentProfile() async {
    ProfileDto profileDto = await _authApiService.fetchCurrentProfile();
    return profileDto.toEntity();
  }

  @override
  Future<void> updateCurrentProfile({
    required String username,
    required String password,
    required String? avatarPath,
    required String? avatarFilePath
  }) {
    return _authApiService.updateCurrentProfile(
      username: username,
      password: password,
      avatarPath: avatarPath,
      avatarFilePath: avatarFilePath
    );
  }
}