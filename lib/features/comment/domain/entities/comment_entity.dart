import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';

part 'comment_entity.freezed.dart';

@freezed
class CommentEntity({
  required final String id,
  required final ProfileEntity profile,
  required final String content,
  required final DateTime createdAt
}) with _$CommentEntity;