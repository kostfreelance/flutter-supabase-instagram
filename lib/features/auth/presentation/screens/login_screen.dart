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
import '../controllers/login_controller.dart';
import '../widgets/auth_text_field.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String path = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = loginControllerProvider;
    return AppScaffold(
      appBody: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConfig.appName,
              style: TextStyle(
                fontFamily: 'Cookie-Regular',
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
                color: context.colors.onSurface
              )
            ),
            SizedBox(height: 36.h),
            Consumer(
              builder: (context, ref, _) =>
                AuthTextField(
                  key: const Key('login_email_textfield'),
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  onChanged: ref.read(provider.notifier).onEmailChanged
                )
            ),
            SizedBox(height: 6.h),
            Consumer(
              builder: (context, ref, _) =>
                AuthTextField(
                  key: const Key('login_password_textfield'),
                  obscureText: true,
                  hintText: 'Password',
                  onChanged: ref.read(provider.notifier).onPasswordChanged
                )
            ),
            SizedBox(height: 6.h),
            Consumer(
              builder: (context, ref, _) =>
                AppButton(
                  key: const Key('login_button'),
                  height: 44.w,
                  borderRadius: BorderRadius.circular(6.r),
                  backgroundColor: context.colors.primary,
                  onPressed: ref.watch(provider.select((s) => s.isValid)) ?
                    () async {
                      AppLoader.open(context);
                      try {
                        await ref.read(provider.notifier).login();
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
                    'Log In',
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
              "Don't have an account?",
              style: TextStyle(
                fontSize: 14.sp,
                color: context.colors.onSurfaceVariant
              )
            ),
            AppButton(
              height: 44.w,
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Sign Up.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary
                )
              ),
              onPressed: () =>
                context.push(RegisterScreen.path)
            )
          ]
        )
      )
    );
  }
}