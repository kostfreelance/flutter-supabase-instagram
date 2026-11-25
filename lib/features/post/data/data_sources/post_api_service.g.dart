// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postApiService)
final postApiServiceProvider = PostApiServiceProvider._();

final class PostApiServiceProvider
    extends $FunctionalProvider<PostApiService, PostApiService, PostApiService>
    with $Provider<PostApiService> {
  PostApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postApiServiceHash();

  @$internal
  @override
  $ProviderElement<PostApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostApiService create(Ref ref) {
    return postApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostApiService>(value),
    );
  }
}

String _$postApiServiceHash() => r'7b1bd2bf1ea8a5814371423f452b5862d6511c08';
