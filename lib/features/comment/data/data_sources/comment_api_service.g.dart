// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commentApiService)
final commentApiServiceProvider = CommentApiServiceProvider._();

final class CommentApiServiceProvider
    extends
        $FunctionalProvider<
          CommentApiService,
          CommentApiService,
          CommentApiService
        >
    with $Provider<CommentApiService> {
  CommentApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentApiServiceHash();

  @$internal
  @override
  $ProviderElement<CommentApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentApiService create(Ref ref) {
    return commentApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentApiService>(value),
    );
  }
}

String _$commentApiServiceHash() => r'd7415602962932c5874a0346388c25d93f09129e';
