import '../entities/chat_entity.dart';
import '../entities/chat_message_entity.dart';

abstract class ChatRepository {
  Stream<List<ChatEntity>> watchChats();
  Future<String?> fetchChatId(String profileId);
  Future<String> addChat(String profileId);
  Future<void> deleteChat(String chatId);
  Stream<List<ChatMessageEntity>> watchChatMessages({
    required String chatId,
    required int limit
  });
  Future<List<ChatMessageEntity>> fetchChatMessages({
    required String chatId,
    required int page,
    required int pageSize
  });
  Future<void> addChatMessage({
    required String chatId,
    required String profileId,
    required String content
  });
}