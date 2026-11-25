// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommentsController)
final commentsControllerProvider = CommentsControllerFamily._();

final class CommentsControllerProvider
    extends $StreamNotifierProvider<CommentsController, CommentsState> {
  CommentsControllerProvider._({
    required CommentsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentsControllerHash();

  @override
  String toString() {
    return r'commentsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CommentsController create() => CommentsController();

  @override
  bool operator ==(Object other) {
    return other is CommentsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentsControllerHash() =>
    r'5e739217b18fec8c97915462e25014581e78c95a';

final class CommentsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          CommentsController,
          AsyncValue<CommentsState>,
          CommentsState,
          Stream<CommentsState>,
          String
        > {
  CommentsControllerFamily._()
    : super(
        retry: null,
        name: r'commentsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CommentsControllerProvider call(String postId) =>
      CommentsControllerProvider._(argument: postId, from: this);

  @override
  String toString() => r'commentsControllerProvider';
}

abstract class _$CommentsController extends $StreamNotifier<CommentsState> {
  late final _$args = ref.$arg as String;
  String get postId => _$args;

  Stream<CommentsState> build(String postId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CommentsState>, CommentsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CommentsState>, CommentsState>,
              AsyncValue<CommentsState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
