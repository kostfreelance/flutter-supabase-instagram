import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repositories/comment_repository_impl.dart';
import '../../domain/entities/comment_entity.dart';

part 'comments_controller.g.dart';
part 'comments_controller.freezed.dart';

@freezed
abstract class CommentsState with _$CommentsState {
  const factory CommentsState({
    required List<CommentEntity> comments,
    required bool hasMore,
    @Default(false) bool isCommentValid
  }) = _CommentsState;
}

@riverpod
class CommentsController extends _$CommentsController {
  final int _pageSize = 15;
  int _page = 0;
  String _comment = '';

  @override
  Stream<CommentsState> build(String postId) =>
    ref.watch(commentRepositoryProvider).watchComments(
      postId: postId,
      limit: _pageSize
    ).map((comments) {
      _page = 0;
      return CommentsState(
        comments: comments,
        hasMore: comments.length == _pageSize
      );
    });

  void fetchNextComments() async {
    final newComments = await ref.read(commentRepositoryProvider).fetchComments(
      postId: postId,
      page: ++_page,
      pageSize: _pageSize
    );
    state = AsyncData(state.requireValue.copyWith(
      comments: [...state.requireValue.comments, ...newComments],
      hasMore: newComments.length == _pageSize
    ));
  }

  void onCommentChanged(String comment) {
    _comment = comment;
    state = AsyncData(state.requireValue.copyWith(
      isCommentValid: _comment.isNotEmpty
    ));
  }

  void onPostPressed() async {
    await ref.read(commentRepositoryProvider).addComment(
      postId: postId,
      content: _comment
    );
    _comment = '';
  }
}