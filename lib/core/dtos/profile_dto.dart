import 'package:json_annotation/json_annotation.dart';
import '../entities/profile_entity.dart';

part 'profile_dto.g.dart';

@JsonSerializable(createToJson: false)
class ProfileDto {
  final String id;
  final String email;
  final String username;
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'followers_count')
  final int followerCount;
  @JsonKey(name: 'following_count')
  final int followingCount;
  @JsonKey(name: 'posts_count')
  final int postCount;

  const ProfileDto({
    required this.id,
    required this.email,
    required this.username,
    this.avatarPath,
    this.avatarUrl,
    required this.followerCount,
    required this.followingCount,
    required this.postCount
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
    _$ProfileDtoFromJson(json);

  ProfileEntity toEntity() =>
    ProfileEntity(
      id: id,
      email: email,
      username: username,
      avatarPath: avatarPath,
      avatarUrl: avatarUrl,
      followerCount: followerCount,
      followingCount: followingCount,
      postCount: postCount
    );
}