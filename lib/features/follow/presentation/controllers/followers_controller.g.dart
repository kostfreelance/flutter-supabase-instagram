// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followers_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FollowersController)
final followersControllerProvider = FollowersControllerFamily._();

final class FollowersControllerProvider
    extends $StreamNotifierProvider<FollowersController, List<ProfileEntity>> {
  FollowersControllerProvider._({
    required FollowersControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'followersControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$followersControllerHash();

  @override
  String toString() {
    return r'followersControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FollowersController create() => FollowersController();

  @override
  bool operator ==(Object other) {
    return other is FollowersControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$followersControllerHash() =>
    r'7b76fd779d02c50c2ff136d54e916c657f02c97b';

final class FollowersControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FollowersController,
          AsyncValue<List<ProfileEntity>>,
          List<ProfileEntity>,
          Stream<List<ProfileEntity>>,
          String
        > {
  FollowersControllerFamily._()
    : super(
        retry: null,
        name: r'followersControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FollowersControllerProvider call(String profileId) =>
      FollowersControllerProvider._(argument: profileId, from: this);

  @override
  String toString() => r'followersControllerProvider';
}

abstract class _$FollowersController
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
