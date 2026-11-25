import 'package:fsi/core/entities/profile_entity.dart';

abstract class AuthRepository {
  Future<void> login(
    String email,
    String password
  );
  Future<void> register(
    String email,
    String username,
    String password
  );
  Future<void> logout();
  String fetchCurrentProfileId();
  Future<ProfileEntity> fetchCurrentProfile();
  Future<void> updateCurrentProfile({
    required String username,
    required String password,
    required String? avatarPath,
    required String? avatarFilePath
  });
}