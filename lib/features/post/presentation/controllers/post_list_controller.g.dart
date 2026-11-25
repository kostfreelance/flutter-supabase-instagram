// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostListController)
final postListControllerProvider = PostListControllerProvider._();

final class PostListControllerProvider
    extends $AsyncNotifierProvider<PostListController, PostListState> {
  PostListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postListControllerHash();

  @$internal
  @override
  PostListController create() => PostListController();
}

String _$postListControllerHash() =>
    r'649c7d8d38fb92a4c67b71e0c5cab2a21757bb18';

abstract class _$PostListController extends $AsyncNotifier<PostListState> {
  FutureOr<PostListState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PostListState>, PostListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PostListState>, PostListState>,
              AsyncValue<PostListState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
