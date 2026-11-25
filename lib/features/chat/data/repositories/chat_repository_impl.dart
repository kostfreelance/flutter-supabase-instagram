import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_sources/chat_api_service.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/repositories/chat_repository.dart';

part 'chat_repository_impl.g.dart';

@riverpod
ChatRepository chatRepository(Ref ref) =>
  ChatRepositoryImpl(ref.watch(chatApiServiceProvider));

class ChatRepositoryImpl implements ChatRepository {
  final ChatApiService _chatApiService;
  const ChatRepositoryImpl(this._chatApiService);

  @override
  Stream<List<ChatEntity>> watchChats() {
    return _chatApiService.watchChats()
      .map((es) => es.map((e) => e.toEntity()).toList());
  }

  @override
  Future<String?> fetchChatId(String profileId) {
    return _chatApiService.fetchChatId(profileId);
  }

  @override
  Future<String> addChat(String profileId) {
    return _chatApiService.addChat(profileId);
  }

  @override
  Future<void> deleteChat(String chatId) {
    return _chatApiService.deleteChat(chatId);
  }

  @override
  Stream<List<ChatMessageEntity>> watchChatMessages({
    required String chatId,
    required int limit
  }) {
    return _chatApiService.watchChatMessages(
      chatId: chatId,
      limit: limit
    ).map((es) => es.map((e) => e.toEntity()).toList());
  }

  @override
  Future<List<ChatMessageEntity>> fetchChatMessages({
    required String chatId,
    required int page,
    required int pageSize
  }) {
    return _chatApiService.fetchChatMessages(
      chatId: chatId,
      page: page,
      pageSize: pageSize
    ).then((es) => es.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> addChatMessage({
    required String chatId,
    required String profileId,
    required String content
  }) {
    return _chatApiService.addChatMessage(
      chatId: chatId,
      profileId: profileId,
      content: content
    );
  }
}