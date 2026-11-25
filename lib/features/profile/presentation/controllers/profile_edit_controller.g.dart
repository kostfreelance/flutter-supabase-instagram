// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileEditController)
final profileEditControllerProvider = ProfileEditControllerFamily._();

final class ProfileEditControllerProvider
    extends $AsyncNotifierProvider<ProfileEditController, ProfileEditState> {
  ProfileEditControllerProvider._({
    required ProfileEditControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'profileEditControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileEditControllerHash();

  @override
  String toString() {
    return r'profileEditControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProfileEditController create() => ProfileEditController();

  @override
  bool operator ==(Object other) {
    return other is ProfileEditControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileEditControllerHash() =>
    r'b73370590794e307acb7e2884d8e8e34302e4a15';

final class ProfileEditControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProfileEditController,
          AsyncValue<ProfileEditState>,
          ProfileEditState,
          FutureOr<ProfileEditState>,
          String
        > {
  ProfileEditControllerFamily._()
    : super(
        retry: null,
        name: r'profileEditControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProfileEditControllerProvider call(String profileId) =>
      ProfileEditControllerProvider._(argument: profileId, from: this);

  @override
  String toString() => r'profileEditControllerProvider';
}

abstract class _$ProfileEditController
    extends $AsyncNotifier<ProfileEditState> {
  late final _$args = ref.$arg as String;
  String get profileId => _$args;

  FutureOr<ProfileEditState> build(String profileId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProfileEditState>, ProfileEditState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileEditState>, ProfileEditState>,
              AsyncValue<ProfileEditState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
