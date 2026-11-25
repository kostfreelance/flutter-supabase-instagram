import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsi/features/auth/data/repositories/auth_repository_impl.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/entities/post_entity.dart';

part 'post_list_controller.g.dart';
part 'post_list_controller.freezed.dart';

@freezed
abstract class PostListState with _$PostListState {
  const factory PostListState({
    required String currentProfileId,
    required List<PostEntity> posts,
    required bool hasMore,
    @Default(false) bool isSearchOpen
  }) = _PostListState;
}

@riverpod
class PostListController extends _$PostListController {
  final int _pageSize = 15;
  int _page = 0;
  final searchController = TextEditingController();
  final scrollController = ScrollController();

  @override
  Future<PostListState> build() async {
    ref.onDispose(() {
      searchController.dispose();
      scrollController.dispose();
    });
    scrollController.addListener(() {
      if (scrollController.hasClients &&
          scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (state.hasValue && state.requireValue.isSearchOpen) {
          state = AsyncData(state.requireValue.copyWith(isSearchOpen: false));
        }
      }
    });
    final currentProfileId = ref.watch(authRepositoryProvider).fetchCurrentProfileId();
    final posts = await ref.watch(postRepositoryProvider).fetchPosts(
      page: _page,
      pageSize: _pageSize
    );
    return PostListState(
      currentProfileId: currentProfileId,
      posts: posts,
      hasMore: posts.length == _pageSize
    );
  }
  
  Future<void> initPosts() async {
    _page = 0;
    searchController.text = '';
    final posts = await ref.watch(postRepositoryProvider).fetchPosts(
      page: _page,
      pageSize: _pageSize
    );
    state = AsyncData(state.requireValue.copyWith(
      posts: posts,
      hasMore: posts.length == _pageSize
    ));
  }

  void updateSearchQuery(String query) async {
    if (query.isEmpty) {
      await initPosts();
      return;
    }
    state = AsyncData(state.requireValue.copyWith(
      posts: await ref.read(postRepositoryProvider).fetchPostsByQuery(query),
      hasMore: false
    ));
  }

  void onSearchPressed() {
    state = AsyncData(state.requireValue.copyWith(isSearchOpen: true));
  }

  void fetchNextPosts() async {
    final newPosts = await ref.read(postRepositoryProvider).fetchPosts(
      page: ++_page,
      pageSize: _pageSize
    );
    state = AsyncData(state.requireValue.copyWith(
      posts: [...state.requireValue.posts, ...newPosts],
      hasMore: newPosts.length == _pageSize
    ));
  }

  void onLikePressed(String postId) async {
    final post = state.requireValue.posts.firstWhere((e) => e.id == postId);
    if (post.isLiked) {
      await ref.read(postRepositoryProvider).dislikePost(postId);
    } else {
      await ref.read(postRepositoryProvider).likePost(postId);
    }
    updateLikedPosts(postId);
  }

  void updateLikedPosts(String postId) {
    state = AsyncData(state.requireValue.copyWith(
      posts: state.requireValue.posts.map((e) =>
        e.id == postId ?
          e.copyWith(
            isLiked: !e.isLiked,
            likeCount: e.isLiked ?
              e.likeCount - 1 :
              e.likeCount + 1
          ) : e
      ).toList()
    ));
  }

  Future<void> onDeletePressed(String postId) async {
    await ref.read(postRepositoryProvider).deletePost(postId);
    updateDeletedPosts(postId);
  }

  void updateDeletedPosts(String postId) {
    state = AsyncData(state.requireValue.copyWith(
      posts: state.requireValue.posts.where((e) => e.id != postId).toList()
    ));
  }
}