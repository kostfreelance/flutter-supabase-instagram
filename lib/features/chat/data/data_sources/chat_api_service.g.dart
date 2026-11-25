// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatApiService)
final chatApiServiceProvider = ChatApiServiceProvider._();

final class ChatApiServiceProvider
    extends $FunctionalProvider<ChatApiService, ChatApiService, ChatApiService>
    with $Provider<ChatApiService> {
  ChatApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatApiServiceHash();

  @$internal
  @override
  $ProviderElement<ChatApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatApiService create(Ref ref) {
    return chatApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatApiService>(value),
    );
  }
}

String _$chatApiServiceHash() => r'3733e295dfbd8bee79f052ca080cd16604baafc8';
