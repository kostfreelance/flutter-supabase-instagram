import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/models/app_file.dart';
import 'package:fsi/features/post/domain/entities/post_entity.dart';
import '../dtos/post_dto.dart';
import '../data_sources/post_api_service.dart';
import '../../domain/repositories/post_repository.dart';

part 'post_repository_impl.g.dart';

@riverpod
PostRepository postRepository(Ref ref) =>
  PostRepositoryImpl(ref.watch(postApiServiceProvider));

class PostRepositoryImpl implements PostRepository {
  final PostApiService _postApiService;
  const PostRepositoryImpl(this._postApiService);

  @override
  Future<List<PostEntity>> fetchPosts({
    int? page,
    int? pageSize
  }) async {
    List<PostDto> postDtos = await _postApiService.fetchPosts(
      page: page,
      pageSize: pageSize
    );
    return postDtos.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<PostEntity>> fetchPostsByQuery(String query) async {
    List<PostDto> postDtos = await _postApiService.fetchPostsByQuery(query);
    return postDtos.map((e) => e.toEntity()).toList();
  }

  @override
  Stream<List<PostEntity>> watchPostsByProfileId(String profileId) {
    return _postApiService.watchPostsByProfileId(profileId).map((postDtos) =>
      postDtos.map((e) => e.toEntity()).toList()
    );
  }

  @override
  Stream<PostEntity> watchPost(String postId) {
    return _postApiService.watchPost(postId).map((e) => e.toEntity());
  }

  @override
  Future<void> addPost({
    required String caption,
    required AppFile file,
    required Function(double) onProgress
  }) {
    return _postApiService.addPost(
      caption: caption,
      file: file,
      onProgress: onProgress
    );
  }

  @override
  Future<void> deletePost(String postId) {
    return _postApiService.deletePost(postId);
  }

  @override
  Future<void> likePost(String postId) {
    return _postApiService.likePost(postId);
  }

  @override
  Future<void> dislikePost(String postId) {
    return _postApiService.dislikePost(postId);
  }
}