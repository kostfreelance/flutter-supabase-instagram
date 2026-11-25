import '../entities/comment_entity.dart';

abstract class CommentRepository {
  Stream<List<CommentEntity>> watchComments({
    required String postId,
    required int limit
  });
  Future<List<CommentEntity>> fetchComments({
    required String postId,
    required int page,
    required int pageSize
  });
  Future<void> addComment({
    required String postId,
    required String content
  });
}