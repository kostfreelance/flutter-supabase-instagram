import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/storage/storage_service.dart';
import 'package:fsi/core/dtos/profile_dto.dart';
import 'package:fsi/core/providers/supabase_provider.dart';

part 'auth_api_service.g.dart';

@riverpod
AuthApiService authApiService(Ref ref) =>
  AuthApiService(
    ref.watch(supabaseClientProvider),
    ref.watch(storageServiceProvider)
  );

class AuthApiService {
  final SupabaseClient _supabaseClient;
  final StorageService _storageService;

  const AuthApiService(
    this._supabaseClient,
    this._storageService
  );

  Future<void> login(
    String email,
    String password
  ) {
    return _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password
    );
  }

  Future<void> register(
    String email,
    String username,
    String password
  ) async {
    final authResponse = await _supabaseClient.auth.signUp(
      email: email,
      password: password
    );
    return _supabaseClient.from('profiles').insert({
      'id': authResponse.user!.id,
      'email': email,
      'username': username
    });
  }

  Future<void> logout() {
    return _supabaseClient.auth.signOut();
  }

  String fetchCurrentProfileId() {
    return _supabaseClient.auth.currentUser!.id;
  }

  Future<ProfileDto> fetchCurrentProfile() {
    return _supabaseClient
      .from('profiles')
      .select()
      .eq('id', _supabaseClient.auth.currentUser!.id)
      .single()
      .then((profileData) =>
        ProfileDto.fromJson(profileData)
      );
  }

  Future<void> updateCurrentProfile({
    required String username,
    required String password,
    required String? avatarPath,
    required String? avatarFilePath
  }) async {
    if (password.isNotEmpty) {
      await _supabaseClient.auth.updateUser(UserAttributes(password: password));
    }
    if (avatarPath != null && avatarFilePath != null) {
      await _storageService.deleteFile(
        bucket: 'profiles',
        bucketPath: avatarPath
      );
    }
    final profileData = <String, Object?>{
      'username': username,
      'updated_at': DateTime.now().toUtc().toIso8601String()
    };
    String currentUserId = _supabaseClient.auth.currentUser!.id;
    if (avatarFilePath != null) {
      profileData['avatar_path'] = '${currentUserId}_${DateTime.now().millisecondsSinceEpoch}.png';
      profileData['avatar_url'] = await _storageService.saveImage(
        bucket: 'profiles',
        bucketPath: profileData['avatar_path'] as String,
        imagePath: avatarFilePath
      );
    }
    return _supabaseClient
      .from('profiles')
      .update(profileData)
      .eq('id', currentUserId);
  }
}