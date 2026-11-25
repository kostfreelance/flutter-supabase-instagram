// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatDetailController)
final chatDetailControllerProvider = ChatDetailControllerFamily._();

final class ChatDetailControllerProvider
    extends $StreamNotifierProvider<ChatDetailController, ChatDetailState> {
  ChatDetailControllerProvider._({
    required ChatDetailControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'chatDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatDetailControllerHash();

  @override
  String toString() {
    return r'chatDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChatDetailController create() => ChatDetailController();

  @override
  bool operator ==(Object other) {
    return other is ChatDetailControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatDetailControllerHash() =>
    r'0cba4da1083bcd8b559e5cc1739b9f2ee2d17b7c';

final class ChatDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ChatDetailController,
          AsyncValue<ChatDetailState>,
          ChatDetailState,
          Stream<ChatDetailState>,
          String
        > {
  ChatDetailControllerFamily._()
    : super(
        retry: null,
        name: r'chatDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChatDetailControllerProvider call(String profileId) =>
      ChatDetailControllerProvider._(argument: profileId, from: this);

  @override
  String toString() => r'chatDetailControllerProvider';
}

abstract class _$ChatDetailController extends $StreamNotifier<ChatDetailState> {
  late final _$args = ref.$arg as String;
  String get profileId => _$args;

  Stream<ChatDetailState> build(String profileId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ChatDetailState>, ChatDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ChatDetailState>, ChatDetailState>,
              AsyncValue<ChatDetailState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
