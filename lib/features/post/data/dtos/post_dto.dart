import 'package:json_annotation/json_annotation.dart';
import 'package:fsi/core/dtos/profile_dto.dart';
import '../../domain/entities/post_entity.dart';

part 'post_dto.g.dart';

@JsonSerializable(createToJson: false)
class PostDto {
  final String id;
  @JsonKey(name: 'profiles')
  final ProfileDto profile;
  @JsonKey(name: 'file_url')
  final String fileUrl;
  @JsonKey(name: 'file_path')
  final String filePath;
  @JsonKey(name: 'thumb_url')
  final String? thumbUrl;
  @JsonKey(name: 'thumb_path')
  final String? thumbPath;
  final String caption;
  @JsonKey(name: 'likes_count')
  final int likeCount;
  @JsonKey(name: 'comments_count')
  final int commentCount;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(includeFromJson: false)
  final bool isLiked;

  const PostDto({
    required this.id,
    required this.profile,
    required this.fileUrl,
    required this.filePath,
    this.thumbUrl,
    this.thumbPath,
    required this.caption,
    required this.likeCount,
    required this.commentCount,
    required this.createdAt,
    this.isLiked = false
  });

  factory PostDto.fromJson(
    Map<String, dynamic> json, {
      required bool isLiked
  }) {
    final dto = _$PostDtoFromJson(json);
    return PostDto(
      id: dto.id,
      profile: dto.profile,
      fileUrl: dto.fileUrl,
      filePath: dto.filePath,
      thumbUrl: dto.thumbUrl,
      thumbPath: dto.thumbPath,
      caption: dto.caption,
      likeCount: dto.likeCount,
      commentCount: dto.commentCount,
      createdAt: dto.createdAt,
      isLiked: isLiked
    );
  }

  PostEntity toEntity() =>
    PostEntity(
      id: id,
      profile: profile.toEntity(),
      fileUrl: fileUrl,
      filePath: filePath,
      thumbUrl: thumbUrl,
      thumbPath: thumbPath,
      caption: caption,
      likeCount: likeCount,
      commentCount: commentCount,
      createdAt: createdAt.toUtc(),
      isLiked: isLiked
    );
}