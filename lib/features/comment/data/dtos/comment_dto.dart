import 'package:json_annotation/json_annotation.dart';
import 'package:fsi/core/dtos/profile_dto.dart';
import '../../domain/entities/comment_entity.dart';

part 'comment_dto.g.dart';

@JsonSerializable(createToJson: false)
class CommentDto {
  final String id;
  @JsonKey(name: 'profiles')
  final ProfileDto profile;
  final String content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const CommentDto({
    required this.id,
    required this.profile,
    required this.content,
    required this.createdAt
  });

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
    _$CommentDtoFromJson(json);

  CommentEntity toEntity() =>
    CommentEntity(
      id: id,
      profile: profile.toEntity(),
      content: content,
      createdAt: createdAt.toUtc()
    );
}