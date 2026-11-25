import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity({
  required final String id,
  required final String email,
  required final String username,
  final String? avatarPath,
  final String? avatarUrl,
  required final int followerCount,
  required final int followingCount,
  required final int postCount
}) with _$ProfileEntity;