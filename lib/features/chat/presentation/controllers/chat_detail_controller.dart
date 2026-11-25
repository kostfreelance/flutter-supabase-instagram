import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import 'package:fsi/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:fsi/features/auth/data/repositories/auth_repository_impl.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../data/repositories/chat_repository_impl.dart';

part 'chat_detail_controller.g.dart';
part 'chat_detail_controller.freezed.dart';

@freezed
abstract class ChatDetailState with _$ChatDetailState {
  const factory ChatDetailState({
    required String currentProfileId,
    required ProfileEntity profile,
    required List<ChatMessageEntity> chatMessages,
    required bool hasMore,
    @Default(false) bool isMessageValid
  }) = _ChatDetailState;
}

@riverpod
class ChatDetailController extends _$ChatDetailController {
  final int _pageSize = 15;
  int _page = 0;
  String? _chatId;
  String _message = '';

  @override
  Stream<ChatDetailState> build(String profileId) async* {
    final currentProfileId = ref.watch(authRepositoryProvider).fetchCurrentProfileId();
    final profile = await ref.watch(profileRepositoryProvider).fetchProfile(profileId);
    _chatId = await ref.watch(chatRepositoryProvider).fetchChatId(profileId);
    if (_chatId == null) {
      yield ChatDetailState(
        currentProfileId: currentProfileId,
        profile: profile,
        chatMessages: [],
        hasMore: false
      );
    } else {
      yield* ref.watch(chatRepositoryProvider).watchChatMessages(
        chatId: _chatId!,
        limit: _pageSize
      ).map((es) {
        _page = 0;
        return ChatDetailState(
          currentProfileId: currentProfileId,
          profile: profile,
          chatMessages: es,
          hasMore: es.length == _pageSize
        );
      });
    }
  }

  void fetchNextMessages() async {
    final newChatMessages = await ref.read(chatRepositoryProvider).fetchChatMessages(
      chatId: _chatId!,
      page: ++_page,
      pageSize: _pageSize
    );
    state = AsyncData(state.requireValue.copyWith(
      chatMessages: [...state.requireValue.chatMessages, ...newChatMessages],
      hasMore: newChatMessages.length == _pageSize
    ));
  }

  void onMessageChanged(String message) {
    _message = message;
    state = AsyncData(state.requireValue.copyWith(
      isMessageValid: _message.isNotEmpty
    ));
  }

  void onSendPressed() async {
    bool isChatValid = _chatId != null;
    if (!isChatValid) {
      _chatId = await ref.read(chatRepositoryProvider).addChat(profileId);
    }
    await ref.read(chatRepositoryProvider).addChatMessage(
      chatId: _chatId!,
      profileId: profileId,
      content: _message
    );
    _message = '';
    if (!isChatValid) ref.invalidateSelf();
  }
}