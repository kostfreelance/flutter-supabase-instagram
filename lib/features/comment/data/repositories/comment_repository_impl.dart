import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_sources/comment_api_service.dart';
import '../../domain/entities/comment_entity.dart';
import '../../domain/repositories/comment_repository.dart';

part 'comment_repository_impl.g.dart';

@riverpod
CommentRepository commentRepository(Ref ref) =>
  CommentRepositoryImpl(ref.watch(commentApiServiceProvider));

class CommentRepositoryImpl implements CommentRepository {
  final CommentApiService _commentApiService;
  const CommentRepositoryImpl(this._commentApiService);

  @override
  Stream<List<CommentEntity>> watchComments({
    required String postId,
    required int limit
  }) {
    return _commentApiService.watchComments(
      postId: postId,
      limit: limit
    ).map((es) => es.map((e) => e.toEntity()).toList());
  }

  @override
  Future<List<CommentEntity>> fetchComments({
    required String postId,
    required int page,
    required int pageSize
  }) {
    return _commentApiService.fetchComments(
      postId: postId,
      page: page,
      pageSize: pageSize
    ).then((es) => es.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> addComment({
    required String postId,
    required String content,
  }) {
    return _commentApiService.addComment(
      postId: postId,
      content: content
    );
  }
}