import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/providers/supabase_provider.dart';
import 'package:fsi/core/dtos/profile_dto.dart';

part 'profile_api_service.g.dart';

@riverpod
ProfileApiService profileApiService(Ref ref) =>
  ProfileApiService(ref.watch(supabaseClientProvider));

class ProfileApiService {
  final SupabaseClient _supabaseClient;

  const ProfileApiService(this._supabaseClient);

  Stream<List<ProfileDto>> watchProfiles() {
    return _supabaseClient
      .from('profiles')
      .stream(primaryKey: ['id'])
      .neq('id', _supabaseClient.auth.currentUser!.id)
      .order('updated_at', ascending: false)
      .map((data) =>
        data.map((e) =>
          ProfileDto.fromJson(e)
        ).toList()
      );
  }

  Stream<ProfileDto> watchProfile(String profileId) {
    return _supabaseClient
      .from('profiles')
      .stream(primaryKey: ['id'])
      .eq('id', profileId)
      .map((data) =>
        ProfileDto.fromJson(data.first)
      );
  }

  Future<ProfileDto> fetchProfile(String profileId) {
    return watchProfile(profileId).first;
  }
}