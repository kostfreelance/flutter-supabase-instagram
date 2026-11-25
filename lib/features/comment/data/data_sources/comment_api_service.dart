import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/providers/supabase_provider.dart';
import '../dtos/comment_dto.dart';

part 'comment_api_service.g.dart';

@riverpod
CommentApiService commentApiService(Ref ref) =>
  CommentApiService(ref.watch(supabaseClientProvider));

class CommentApiService {
  final SupabaseClient _supabaseClient;

  CommentApiService(this._supabaseClient);

  Stream<List<CommentDto>> watchComments({
    required String postId,
    required int limit
  }) {
    return _supabaseClient
      .from('post_comments')
      .stream(primaryKey: ['id'])
      .eq('post_id', postId)
      .order('created_at', ascending: false)
      .limit(limit)
      .asyncMap((commentsData) async {
        if (commentsData.isEmpty) return [];
        final profileIds = commentsData.map((e) => e['profile_id'] as String).toSet().toList();
        final profilesData = await _supabaseClient
          .from('profiles')
          .select()
          .inFilter('id', profileIds);
        final profilesMap = Map.fromEntries(
          profilesData.map((e) => MapEntry(e['id'] as String, e)),
        );
        return commentsData.map((e) => {
          ...e,
          'profiles': profilesMap[e['profile_id']]
        }).map((e) => CommentDto.fromJson(e)).toList();
      });
  }

  Future<List<CommentDto>> fetchComments({
    required String postId,
    required int page,
    required int pageSize
  }) async {
    var query = _supabaseClient
      .from('post_comments')
      .select('*, profiles!profile_id(*)')
      .eq('post_id', postId)
      .order('created_at', ascending: false);
    final from = page * pageSize;
    final to = from + pageSize - 1;
    query = query.range(from, to);
    final response = await query;
    return response.map((e) => CommentDto.fromJson(e)).toList();
  }

  Future<void> addComment({
    required String postId,
    required String content
  }) {
    return _supabaseClient
      .from('post_comments')
      .insert({
        'post_id': postId,
        'profile_id': _supabaseClient.auth.currentUser!.id,
        'content': content
      });
  }
}