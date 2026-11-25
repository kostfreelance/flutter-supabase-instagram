// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileDetailController)
final profileDetailControllerProvider = ProfileDetailControllerFamily._();

final class ProfileDetailControllerProvider
    extends
        $StreamNotifierProvider<ProfileDetailController, ProfileDetailState> {
  ProfileDetailControllerProvider._({
    required ProfileDetailControllerFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'profileDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileDetailControllerHash();

  @override
  String toString() {
    return r'profileDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProfileDetailController create() => ProfileDetailController();

  @override
  bool operator ==(Object other) {
    return other is ProfileDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileDetailControllerHash() =>
    r'06764e89dda4e3bc6101b072d96e40cd15f1919e';

final class ProfileDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProfileDetailController,
          AsyncValue<ProfileDetailState>,
          ProfileDetailState,
          Stream<ProfileDetailState>,
          String?
        > {
  ProfileDetailControllerFamily._()
    : super(
        retry: null,
        name: r'profileDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProfileDetailControllerProvider call(String? profileId) =>
      ProfileDetailControllerProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileDetailControllerProvider';
}

abstract class _$ProfileDetailController
    extends $StreamNotifier<ProfileDetailState> {
  late final _$args = ref.$arg as String?;
  String? get profileId => _$args;

  Stream<ProfileDetailState> build(String? profileId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProfileDetailState>, ProfileDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileDetailState>, ProfileDetailState>,
              AsyncValue<ProfileDetailState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
