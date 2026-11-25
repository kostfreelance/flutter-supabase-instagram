import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_action_sheet.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/core/widgets/app_button.dart';
import 'package:fsi/core/widgets/app_snack_bar.dart';
import 'package:fsi/core/widgets/app_image.dart';
import 'package:fsi/core/widgets/app_text_field.dart';
import 'package:fsi/core/widgets/app_loader.dart';
import '../controllers/profile_edit_controller.dart';

class ProfileEditScreen extends StatelessWidget {
  static const String path = 'profile-edit';
  final String profileId;

  const ProfileEditScreen({
    super.key,
    required this.profileId
  });

  void _pickImage(
    BuildContext context,
    ImageSource imageSource,
    Function(String) onAvatarPicked
  ) async {
    XFile? pickedImage = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 100,
      maxWidth: 180
    );
    if (pickedImage != null) {
      onAvatarPicked(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = profileEditControllerProvider(profileId);
    return AppScaffold(
      appNavBar: AppNavBar(
        leftButton: AppButton(
          width: 84.w,
          height: 50.w,
          onPressed: context.pop,
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.colors.onSurface
            )
          )
        ),
        title: const AppNavBarTitle('Edit Profile'),
        rightButton: Consumer(
          builder: (context, ref, _) =>
            AppButton(
              width: 84.w,
              height: 50.w,
              onPressed: ref.watch(provider.select((s) => s.value?.isValid ?? false)) ?
                () async {
                  AppLoader.open(context);
                  try {
                    await ref.read(provider.notifier).save();
                    if (!context.mounted) return;
                    AppLoader.close(context);
                    context.pop();
                  } catch (e) {
                    AppLoader.close(context);
                    AppSnackBar.open(
                      context,
                      text: e.toString(),
                      type: AppSnackBarType.error
                    );
                  }
                } : null,
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary
                )
              )
            )
        )
      ),
      appBody: ListView(
        padding: EdgeInsets.zero,
        children: [
          Consumer(
            builder: (context, ref, _) {
              final avatarFilePath = ref.watch(provider.select((s) => s.value?.avatarFilePath));
              return AppButton(
                padding: EdgeInsets.symmetric(vertical: 25.w),
                onPressed: () =>
                  AppActionSheet.open(
                    context,
                    items: [
                      AppActionSheetItem(
                        'Take Photo',
                        onPressed: () =>
                          _pickImage(
                            context,
                            ImageSource.camera,
                            ref.read(provider.notifier).onAvatarPicked
                          )
                      ), 
                      AppActionSheetItem(
                        'Photo from Library',
                        onPressed: () =>
                          _pickImage(
                            context,
                            ImageSource.gallery,
                            ref.read(provider.notifier).onAvatarPicked
                          )
                      )
                    ]
                  ),
                child: Column(
                  children: [
                    avatarFilePath != null ?
                      CircleAvatar(
                        radius: 45.w,
                        backgroundColor: context.colors.onSurface,
                        backgroundImage: FileImage(File(avatarFilePath))
                      ) :
                      AppAvatar(
                        ref.watch(provider.select((s) => s.value?.avatarUrl)),
                        size: 90.w
                      ),
                    SizedBox(height: 12.h),
                    Text(
                      'Change Profile Photo',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: context.colors.primary
                      )
                    )
                  ]
                )
              );
            }
          ),
          Consumer(
            builder: (context, ref, _) =>
              _TextFieldWidget(
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
                label: 'Email',
                hintText: 'Email',
                controller: ref.read(provider.notifier).emailController,
                onChanged: ref.read(provider.notifier).onFieldChanged
              )
          ),
          Consumer(
            builder: (context, ref, _) =>
              _TextFieldWidget(
                label: 'Username',
                hintText: 'Username',
                controller: ref.read(provider.notifier).usernameController,
                onChanged: ref.read(provider.notifier).onFieldChanged
              )
          ),
          Consumer(
            builder: (context, ref, _) =>
              _TextFieldWidget(
                obscureText: true,
                label: 'Password',
                hintText: 'Password',
                controller: ref.read(provider.notifier).passwordController,
                onChanged: ref.read(provider.notifier).onFieldChanged
              )
          ),
          Consumer(
            builder: (context, ref, _) =>
              _TextFieldWidget(
                obscureText: true,
                label: 'Confirm Password',
                hintText: 'Confirm Password',
                controller: ref.read(provider.notifier).confirmPasswordController,
                onChanged: ref.read(provider.notifier).onFieldChanged
              )
          )
        ]
      )
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? obscureText;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final Function() onChanged;

  const _TextFieldWidget({
    this.keyboardType,
    this.readOnly,
    this.obscureText,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) =>
    Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 25.h
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: context.colors.onSurfaceVariant
            )
          ),
          AppTextField(
            border: UnderlineInputBorder(      
              borderSide: BorderSide(
                color: context.colors.onSurfaceVariant,
                width: 1
              )   
            ),
            padding: EdgeInsets.only(
              top: 12.w,
              bottom: 8.w
            ),
            keyboardType: keyboardType,
            readOnly: readOnly,
            obscureText: obscureText ?? false,
            hintText: hintText,
            controller: controller,
            onChanged: (_) => onChanged()
          )
        ]
      )
    );
}