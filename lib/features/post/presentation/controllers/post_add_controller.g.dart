// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_add_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostAddController)
final postAddControllerProvider = PostAddControllerFamily._();

final class PostAddControllerProvider
    extends $NotifierProvider<PostAddController, PostAddState> {
  PostAddControllerProvider._({
    required PostAddControllerFamily super.from,
    required AppFile super.argument,
  }) : super(
         retry: null,
         name: r'postAddControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postAddControllerHash();

  @override
  String toString() {
    return r'postAddControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostAddController create() => PostAddController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostAddControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postAddControllerHash() => r'7bcfcf704c53da512b9ae469280dfa46bff1cb41';

final class PostAddControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PostAddController,
          PostAddState,
          PostAddState,
          PostAddState,
          AppFile
        > {
  PostAddControllerFamily._()
    : super(
        retry: null,
        name: r'postAddControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PostAddControllerProvider call(AppFile file) =>
      PostAddControllerProvider._(argument: file, from: this);

  @override
  String toString() => r'postAddControllerProvider';
}

abstract class _$PostAddController extends $Notifier<PostAddState> {
  late final _$args = ref.$arg as AppFile;
  AppFile get file => _$args;

  PostAddState build(AppFile file);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PostAddState, PostAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PostAddState, PostAddState>,
              PostAddState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
