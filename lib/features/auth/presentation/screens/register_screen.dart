import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/config/app_config.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';
import 'package:fsi/core/widgets/app_button.dart';
import 'package:fsi/core/widgets/app_snack_bar.dart';
import 'package:fsi/core/widgets/app_loader.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/features/post/presentation/screens/post_list_screen.dart';
import '../controllers/register_controller.dart';
import '../widgets/auth_text_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String path = '/register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = registerControllerProvider;
    return AppScaffold(
      appBody: Center(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            Center(
              child: Text(
                AppConfig.appName,
                style: TextStyle(
                  fontFamily: 'Cookie-Regular',
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colors.onSurface
                )
              )
            ),
            SizedBox(height: 36.h),
            Text(
              'Sign up to see photos and videos from your friends.',
              style: TextStyle(
                fontSize: 16.sp,
                color: context.colors.onSurfaceVariant
              )
            ),
            SizedBox(height: 20.h),
            Consumer(
              builder: (context, ref, _) =>
                AuthTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  onChanged: ref.read(provider.notifier).onEmailChanged
                )
            ),
            SizedBox(height: 6.h),
            Consumer(
              builder: (context, ref, _) =>
                AuthTextField(
                  hintText: 'Username',
                  onChanged: ref.read(provider.notifier).onUsernameChanged
                )
            ),
            SizedBox(height: 6.h),
            Consumer(
              builder: (context, ref, _) =>
                AuthTextField(
                  obscureText: true,
                  hintText: 'Password',
                  onChanged: ref.read(provider.notifier).onPasswordChanged
                )
            ),
            SizedBox(height: 6.h),
            Consumer(
              builder: (context, ref, _) =>
                AuthTextField(
                  obscureText: true,
                  hintText: 'Confirm Password',
                  onChanged: ref.read(provider.notifier).onConfirmPasswordChanged
                )
            ),
            SizedBox(height: 20.h),
            Consumer(
              builder: (context, ref, _) =>
                AppButton(
                  height: 44.w,
                  borderRadius: BorderRadius.circular(6.r),
                  backgroundColor: context.colors.primary,
                  onPressed: ref.watch(provider.select((s) => s.isValid)) ?
                    () async {
                      AppLoader.open(context);
                      try {
                        await ref.read(provider.notifier).register();
                        if (!context.mounted) return;
                        AppLoader.close(context);
                        context.go(PostListScreen.path);
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
                    'Sign up',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: context.colors.onPrimary
                    )
                  )
                )
            )
          ]
        )
      ),
      appBottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: AppScreenUtil.bottomBarHeight),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: context.colors.outline
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: 14.sp,
                color: context.colors.onSurfaceVariant
              )
            ),
            AppButton(
              height: 44.w,
              padding: EdgeInsets.only(left: 10.w),
              onPressed: context.pop,
              child: Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary
                )
              )
            )
          ]
        )
      )
    );
  }
}