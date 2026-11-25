// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FollowingController)
final followingControllerProvider = FollowingControllerFamily._();

final class FollowingControllerProvider
    extends $StreamNotifierProvider<FollowingController, List<ProfileEntity>> {
  FollowingControllerProvider._({
    required FollowingControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'followingControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$followingControllerHash();

  @override
  String toString() {
    return r'followingControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FollowingController create() => FollowingController();

  @override
  bool operator ==(Object other) {
    return other is FollowingControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$followingControllerHash() =>
    r'44b3cc99dde8c1b31ebb099f37c78c1fff78fafc';

final class FollowingControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FollowingController,
          AsyncValue<List<ProfileEntity>>,
          List<ProfileEntity>,
          Stream<List<ProfileEntity>>,
          String
        > {
  FollowingControllerFamily._()
    : super(
        retry: null,
        name: r'followingControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FollowingControllerProvider call(String profileId) =>
      FollowingControllerProvider._(argument: profileId, from: this);

  @override
  String toString() => r'followingControllerProvider';
}

abstract class _$FollowingController
    extends $StreamNotifier<List<ProfileEntity>> {
  late final _$args = ref.$arg as String;
  String get profileId => _$args;

  Stream<List<ProfileEntity>> build(String profileId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProfileEntity>>, List<ProfileEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProfileEntity>>, List<ProfileEntity>>,
              AsyncValue<List<ProfileEntity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
