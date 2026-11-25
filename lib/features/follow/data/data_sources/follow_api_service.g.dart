// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(followApiService)
final followApiServiceProvider = FollowApiServiceProvider._();

final class FollowApiServiceProvider
    extends
        $FunctionalProvider<
          FollowApiService,
          FollowApiService,
          FollowApiService
        >
    with $Provider<FollowApiService> {
  FollowApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'followApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$followApiServiceHash();

  @$internal
  @override
  $ProviderElement<FollowApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FollowApiService create(Ref ref) {
    return followApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FollowApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FollowApiService>(value),
    );
  }
}

String _$followApiServiceHash() => r'abad3eb02778feaf27f27ccefe98c47677d242be';
