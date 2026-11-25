import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/models/app_file.dart';
import 'package:fsi/core/storage/storage_service.dart';
import 'package:fsi/core/providers/supabase_provider.dart';
import '../dtos/post_dto.dart';

part 'post_api_service.g.dart';

@riverpod
PostApiService postApiService(Ref ref) =>
  PostApiService(
    ref.watch(supabaseClientProvider),
    ref.watch(storageServiceProvider)
  );

class PostApiService {
  final SupabaseClient _supabaseClient;
  final StorageService _storageService;

  const PostApiService(
    this._supabaseClient,
    this._storageService
  );

  Future<List<PostDto>> fetchPosts({
    int? page,
    int? pageSize
  }) async {
    final currentProfileId = _supabaseClient.auth.currentUser!.id;
    final followsResponse = await _supabaseClient
      .from('follows')
      .select()
      .eq('follower_id', _supabaseClient.auth.currentUser!.id);
    final followingIds = followsResponse
      .map((row) => row['following_id'] as String)
      .toList();
    final profileAndFollowingIds = [currentProfileId, ...followingIds];
    var query = _supabaseClient
      .from('posts')
      .select('id, profiles!profile_id(*), file_url, file_path, thumb_url, '
        'thumb_path, caption, likes_count, comments_count, created_at')
      .inFilter('profile_id', profileAndFollowingIds)
      .order('created_at', ascending: false);
    if (page != null && pageSize != null) {
      final from = page * pageSize;
      final to = from + pageSize - 1;
      query = query.range(from, to);
    }
    final postsData = await query;
    final likedPostIds = await _fetchLikedPostIds(postsData);
    return postsData.map((e) =>
      PostDto.fromJson(e, isLiked: likedPostIds.contains(e['id'] as String))
    ).toList();
  }

  Future<List<PostDto>> fetchPostsByQuery(String query) async {
    final postsResponse = await _supabaseClient.functions.invoke(
      'search-posts',
      body: {'query': query.trim()}
    );
    final postsData = (postsResponse.data as List)
      .map((e) => e as Map<String, dynamic>)
      .toList();
    final likedPostIds = await _fetchLikedPostIds(postsData);
    return postsData.map((e) =>
      PostDto.fromJson(e, isLiked: likedPostIds.contains(e['id'] as String))
    ).toList();
  }

  Stream<List<PostDto>> watchPostsByProfileId(String profileId) {
    return _supabaseClient
      .from('posts')
      .stream(primaryKey: ['id'])
      .eq('profile_id', profileId)
      .order('created_at', ascending: false)
      .asyncMap((postsData) async {
        if (postsData.isEmpty) return [];
        final profileData = await _supabaseClient
          .from('profiles')
          .select()
          .eq('id', profileId)
          .single();
        final likedPostIds = await _fetchLikedPostIds(postsData);
        return postsData.map((e) =>
          PostDto.fromJson(
            {...e, 'profiles': profileData},
            isLiked: likedPostIds.contains(e['id'] as String)
          )
        ).toList();
      });
  }

  Stream<PostDto> watchPost(String postId) {
    return _supabaseClient
      .from('posts')
      .stream(primaryKey: ['id'])
      .eq('id', postId)
      .asyncMap((postsData) async {
        final postData = postsData.first;
        final profileData = await _supabaseClient
          .from('profiles')
          .select()
          .eq('id', postData['profile_id'])
          .single();
        final likedPostIds = await _fetchLikedPostIds([postData]);
        return PostDto.fromJson(
          {...postData, 'profiles': profileData},
          isLiked: likedPostIds.contains(postData['id'] as String)
        );
      });
  }

  Future<void> addPost({
    required String caption,
    required AppFile file,
    required Function(double) onProgress
  }) async {
    final postId = Uuid().v4();
    final postData = <String, dynamic>{
      'id': postId,
      'profile_id': _supabaseClient.auth.currentUser!.id,
      'caption': caption
    };
    switch (file.type) {
      case AppFileType.image:
        postData['file_path'] = '$postId.png';
        postData['file_url'] = await _storageService.saveImage(
          bucket: 'posts',
          bucketPath: postData['file_path']!,
          imagePath: file.content.path,
          onProgress: onProgress
        );
      case AppFileType.video:
        postData['file_path'] = '$postId${p.extension(file.content.path)}';
        postData['thumb_path'] = '$postId.png';
        final urls = await _storageService.saveVideo(
          bucket: 'posts',
          videoBucketPath: postData['file_path']!,
          thumbBucketPath: postData['thumb_path']!,
          videoPath: file.content.path,
          onProgress: onProgress
        );
        postData['file_url'] = urls.$1;
        postData['thumb_url'] = urls.$2;
    }
    final embResponse = await Future.wait([
      _supabaseClient.functions.invoke(
        'embed-text',
        body: {'text': postData['caption']}
      ),
      _supabaseClient.functions.invoke(
        'embed-image',
        body: {'imageUrl': postData['thumb_url'] ?? postData['file_url']}
      )
    ]);
    postData['caption_embedding'] = (embResponse[0].data as Map<String, dynamic>)['embedding'];
    postData['file_embedding'] = (embResponse[1].data as Map<String, dynamic>)['embedding'];
    return _supabaseClient
      .from('posts')
      .insert(postData);
  }

  Future<void> deletePost(String postId) async {
    final postData = await _supabaseClient
      .from('posts')
      .select('file_path, thumb_path')
      .eq('id', postId)
      .single();
    await _storageService.deleteFile(
      bucket: 'posts',
      bucketPath: postData['file_path']
    );
    String? thumbPath = postData['thumb_path'];
    if (thumbPath != null) {
      await _storageService.deleteFile(
        bucket: 'posts',
        bucketPath: thumbPath
      );
    }
    return _supabaseClient
      .from('posts')
      .delete()
      .eq('id', postId);
  }

  Future<void> likePost(String postId) {
    return _supabaseClient.from('post_likes').insert({
      'post_id': postId,
      'profile_id': _supabaseClient.auth.currentUser!.id
    });
  }

  Future<void> dislikePost(String postId) {
    return _supabaseClient
      .from('post_likes')
      .delete()
      .eq('post_id', postId)
      .eq('profile_id', _supabaseClient.auth.currentUser!.id);
  }

  Future<Set<String>> _fetchLikedPostIds(List<Map<String, dynamic>> postsData) async {
    final postIds = postsData.map((p) => p['id'] as String).toList();
    final likesData = await _supabaseClient
      .from('post_likes')
      .select()
      .eq('profile_id', _supabaseClient.auth.currentUser!.id)
      .inFilter('post_id', postIds);
    return likesData
      .map((e) => e['post_id'] as String)
      .toSet();
  }
}