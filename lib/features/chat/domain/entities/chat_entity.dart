import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import 'chat_message_entity.dart';

part 'chat_entity.freezed.dart';

@freezed
class ChatEntity({
  required final String id,
  required final ProfileEntity profile,
  required final ChatMessageEntity? lastChatMessage,
  required final bool hasUnread
}) with _$ChatEntity;