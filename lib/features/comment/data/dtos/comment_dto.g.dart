// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
  id: json['id'] as String,
  profile: ProfileDto.fromJson(json['profiles'] as Map<String, dynamic>),
  content: json['content'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);
