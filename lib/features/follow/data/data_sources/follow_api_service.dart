import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/providers/supabase_provider.dart';
import 'package:fsi/core/dtos/profile_dto.dart';

part 'follow_api_service.g.dart';

@riverpod
FollowApiService followApiService(Ref ref) =>
  FollowApiService(ref.watch(supabaseClientProvider));

class FollowApiService {
  final SupabaseClient _supabaseClient;

  FollowApiService(this._supabaseClient);

  Stream<List<ProfileDto>> watchFollowers(String profileId) {
    return _supabaseClient
      .from('follows')
      .stream(primaryKey: ['follower_id', 'following_id'])
      .eq('following_id', profileId)
      .order('created_at', ascending: false)
      .asyncMap((followsData) async {
        if (followsData.isEmpty) return [];
        final followerIds = followsData.map((e) => e['follower_id'] as String).toList();
        final profilesData = await _supabaseClient
          .from('profiles')
          .select()
          .inFilter('id', followerIds);
        return (profilesData as List)
          .map((json) => ProfileDto.fromJson(json))
          .toList();
      });
  }

  Stream<List<ProfileDto>> watchFollowing(String profileId) {
    return _supabaseClient
      .from('follows')
      .stream(primaryKey: ['follower_id', 'following_id'])
      .eq('follower_id', profileId)
      .order('created_at', ascending: false)
      .asyncMap((followsData) async {
        if (followsData.isEmpty) return [];
        final followingIds = followsData.map((e) => e['following_id'] as String).toList();
        final profilesData = await _supabaseClient
          .from('profiles')
          .select()
          .inFilter('id', followingIds);
        return (profilesData as List)
          .map((json) => ProfileDto.fromJson(json))
          .toList();
      });
  }

  Future<bool> isFollowing(String profileId) async {
    final followData = await _supabaseClient
      .from('follows')
      .select()
      .eq('follower_id', _supabaseClient.auth.currentUser!.id)
      .eq('following_id', profileId)
      .maybeSingle();
    return followData != null;
  }

  Future<void> follow(String profileId) {
    return _supabaseClient.from('follows').insert({
      'follower_id': _supabaseClient.auth.currentUser!.id,
      'following_id': profileId
    });
  }

  Future<void> unfollow(String profileId) {
    return _supabaseClient.from('follows').delete().match({
      'follower_id': _supabaseClient.auth.currentUser!.id,
      'following_id': profileId
    });
  }
}