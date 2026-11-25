// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    ChatMessageDto(
      id: json['id'] as String,
      profileId: json['profile_id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
