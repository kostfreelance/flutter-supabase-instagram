import 'package:fsi/core/dtos/profile_dto.dart';
import '../../domain/entities/chat_entity.dart';
import 'chat_message_dto.dart';

class ChatDto {
  final String id;
  final ProfileDto profile;
  final ChatMessageDto? lastChatMessage;
  final bool hasUnread;

  const ChatDto({
    required this.id,
    required this.profile,
    required this.lastChatMessage,
    required this.hasUnread
  });

  ChatEntity toEntity() =>
    ChatEntity(
      id: id,
      profile: profile.toEntity(),
      lastChatMessage: lastChatMessage?.toEntity(),
      hasUnread: hasUnread
    );
}