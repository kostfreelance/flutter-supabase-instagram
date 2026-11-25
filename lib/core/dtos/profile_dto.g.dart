// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
  id: json['id'] as String,
  email: json['email'] as String,
  username: json['username'] as String,
  avatarPath: json['avatar_path'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  followerCount: (json['followers_count'] as num).toInt(),
  followingCount: (json['following_count'] as num).toInt(),
  postCount: (json['posts_count'] as num).toInt(),
);
