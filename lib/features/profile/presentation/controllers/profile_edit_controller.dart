import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsi/core/entities/profile_entity.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';

part 'profile_edit_controller.g.dart';
part 'profile_edit_controller.freezed.dart';

@freezed
abstract class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    String? avatarUrl,
    String? avatarFilePath,
    @Default(false) bool isValid
  }) = _ProfileEditState;
}

@riverpod
class ProfileEditController extends _$ProfileEditController {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late final String? _avatarPath;

  @override
  Future<ProfileEditState> build(String profileId) async {
    ref.onDispose(() {
      emailController.dispose();
      usernameController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
    });
    ProfileEntity currentProfile = await ref.watch(authRepositoryProvider).fetchCurrentProfile();
    emailController.text = currentProfile.email;
    usernameController.text = currentProfile.username;
    _avatarPath = currentProfile.avatarPath;
    return ProfileEditState(avatarUrl: currentProfile.avatarUrl);
  }

  void onFieldChanged() {
    state = AsyncData(state.requireValue.copyWith(
      isValid: usernameController.text.isNotEmpty &&
        (passwordController.text == confirmPasswordController.text)
    ));
  }

  void onAvatarPicked(String avatarFilePath) {
    state = AsyncData(state.requireValue.copyWith(avatarFilePath: avatarFilePath));
    onFieldChanged();
  }

  Future<void> save() {
    return ref.read(authRepositoryProvider).updateCurrentProfile(
      username: usernameController.text,
      password: passwordController.text,
      avatarPath: _avatarPath,
      avatarFilePath: state.requireValue.avatarFilePath
    );
  }
}