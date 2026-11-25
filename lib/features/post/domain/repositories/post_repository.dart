import 'package:fsi/core/models/app_file.dart';
import '../entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts({
    int? page,
    int? pageSize
  });
  Future<List<PostEntity>> fetchPostsByQuery(String query);
  Stream<List<PostEntity>> watchPostsByProfileId(String profileId);
  Stream<PostEntity> watchPost(String postId);
  Future<void> addPost({
    required String caption,
    required AppFile file,
    required Function(double) onProgress
  });
  Future<void> deletePost(String postId);
  Future<void> likePost(String postId);
  Future<void> dislikePost(String postId);
}