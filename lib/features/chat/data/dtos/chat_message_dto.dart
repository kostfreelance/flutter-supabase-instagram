import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/chat_message_entity.dart';

part 'chat_message_dto.g.dart';

@JsonSerializable(createToJson: false)
class ChatMessageDto {
  final String id;
  @JsonKey(name: 'profile_id')
  final String profileId;
  final String content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const ChatMessageDto({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt
  });

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) =>
    _$ChatMessageDtoFromJson(json);

  ChatMessageEntity toEntity() =>
    ChatMessageEntity(
      id: id,
      profileId: profileId,
      content: content,
      createdAt: createdAt.toUtc()
    );
}