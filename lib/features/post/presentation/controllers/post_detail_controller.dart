import 'package:rxdart/rxdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsi/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fsi/features/comment/domain/entities/comment_entity.dart';
import 'package:fsi/features/comment/data/repositories/comment_repository_impl.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/entities/post_entity.dart';
import 'post_list_controller.dart';

part 'post_detail_controller.g.dart';
part 'post_detail_controller.freezed.dart';

@freezed
abstract class PostDetailState with _$PostDetailState {
  const factory PostDetailState({
    required String currentProfileId,
    required PostEntity post,
    required List<CommentEntity> comments
  }) = _PostDetailState;
}

@riverpod
class PostDetailController extends _$PostDetailController {
  final int maxCommentCount = 2;

  @override
  Stream<PostDetailState> build(String postId) {
    final currentProfileId = ref.read(authRepositoryProvider).fetchCurrentProfileId();
    return Rx.combineLatest2(
      ref.watch(postRepositoryProvider).watchPost(postId),
      ref.watch(commentRepositoryProvider).watchComments(
        postId: postId,
        limit: maxCommentCount
      ),
      (post, comments) =>
        PostDetailState(
          currentProfileId: currentProfileId,
          post: post,
          comments: comments
        )
    );
  }

  void onLikePressed() async {
    final post = state.requireValue.post;
    if (post.isLiked) {
      await ref.read(postRepositoryProvider).dislikePost(post.id);
    } else {
      await ref.read(postRepositoryProvider).likePost(post.id);
    }
    ref.read(postListControllerProvider.notifier).updateLikedPosts(post.id);
  }

  Future<void> onDeletePressed() async {
    final postId = state.requireValue.post.id;
    await ref.read(postRepositoryProvider).deletePost(postId);
    ref.read(postListControllerProvider.notifier).updateDeletedPosts(postId);
  }
}