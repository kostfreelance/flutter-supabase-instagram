// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileListController)
final profileListControllerProvider = ProfileListControllerProvider._();

final class ProfileListControllerProvider
    extends
        $StreamNotifierProvider<ProfileListController, List<ProfileEntity>> {
  ProfileListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileListControllerHash();

  @$internal
  @override
  ProfileListController create() => ProfileListController();
}

String _$profileListControllerHash() =>
    r'4666f5a4b3c5f2891887348632711c5568233b16';

abstract class _$ProfileListController
    extends $StreamNotifier<List<ProfileEntity>> {
  Stream<List<ProfileEntity>> build();
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
    return element.handleCreate(ref, build);
  }
}
