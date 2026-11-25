import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_entity.freezed.dart';

@freezed
class ChatMessageEntity({
  required final String id,
  required final String profileId,
  required final String content,
  required final DateTime createdAt
}) with _$ChatMessageEntity;