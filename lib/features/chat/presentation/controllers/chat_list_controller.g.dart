// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatListController)
final chatListControllerProvider = ChatListControllerProvider._();

final class ChatListControllerProvider
    extends $StreamNotifierProvider<ChatListController, List<ChatEntity>> {
  ChatListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatListControllerHash();

  @$internal
  @override
  ChatListController create() => ChatListController();
}

String _$chatListControllerHash() =>
    r'ec686024f7b60e82bc41141f0de34ebc58fa39ae';

abstract class _$ChatListController extends $StreamNotifier<List<ChatEntity>> {
  Stream<List<ChatEntity>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ChatEntity>>, List<ChatEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ChatEntity>>, List<ChatEntity>>,
              AsyncValue<List<ChatEntity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
