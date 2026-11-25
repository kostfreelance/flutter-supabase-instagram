import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';

part 'post_entity.freezed.dart';

@freezed
class PostEntity({
  required final String id,
  required final ProfileEntity profile,
  required final String fileUrl,
  required final String filePath,
  final String? thumbUrl,
  final String? thumbPath,
  required final String caption,
  required final int likeCount,
  required final int commentCount,
  required final DateTime createdAt,
  required final bool isLiked
}) with _$PostEntity;