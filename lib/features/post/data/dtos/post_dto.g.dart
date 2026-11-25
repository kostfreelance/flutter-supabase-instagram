// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDto _$PostDtoFromJson(Map<String, dynamic> json) => PostDto(
  id: json['id'] as String,
  profile: ProfileDto.fromJson(json['profiles'] as Map<String, dynamic>),
  fileUrl: json['file_url'] as String,
  filePath: json['file_path'] as String,
  thumbUrl: json['thumb_url'] as String?,
  thumbPath: json['thumb_path'] as String?,
  caption: json['caption'] as String,
  likeCount: (json['likes_count'] as num).toInt(),
  commentCount: (json['comments_count'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
);
