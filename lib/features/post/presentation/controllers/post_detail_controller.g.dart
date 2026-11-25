// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostDetailController)
final postDetailControllerProvider = PostDetailControllerFamily._();

final class PostDetailControllerProvider
    extends $StreamNotifierProvider<PostDetailController, PostDetailState> {
  PostDetailControllerProvider._({
    required PostDetailControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'postDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postDetailControllerHash();

  @override
  String toString() {
    return r'postDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostDetailController create() => PostDetailController();

  @override
  bool operator ==(Object other) {
    return other is PostDetailControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postDetailControllerHash() =>
    r'd5f899129c6033b1e72e3b13bc4a6c7eacf7939d';

final class PostDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PostDetailController,
          AsyncValue<PostDetailState>,
          PostDetailState,
          Stream<PostDetailState>,
          String
        > {
  PostDetailControllerFamily._()
    : super(
        retry: null,
        name: r'postDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PostDetailControllerProvider call(String postId) =>
      PostDetailControllerProvider._(argument: postId, from: this);

  @override
  String toString() => r'postDetailControllerProvider';
}

abstract class _$PostDetailController extends $StreamNotifier<PostDetailState> {
  late final _$args = ref.$arg as String;
  String get postId => _$args;

  Stream<PostDetailState> build(String postId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PostDetailState>, PostDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PostDetailState>, PostDetailState>,
              AsyncValue<PostDetailState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
