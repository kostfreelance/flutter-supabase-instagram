import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';
import 'app_button.dart';

final class AppScaffold extends StatelessWidget {
  final AppNavBar? appNavBar;
  final Widget appBody;
  final Widget? appBottomNavigationBar;

  const AppScaffold({
    super.key,
    this.appNavBar,
    required this.appBody,
    this.appBottomNavigationBar
  });

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Container()
        )
      ),
      backgroundColor: context.colors.onPrimary,
      body: Column(
        children: [
          ?appNavBar,
          Expanded(child: appBody)
        ]
      ),
      bottomNavigationBar: appBottomNavigationBar
    );
}

final class AppScaffoldChild extends StatelessWidget {
  final AppNavBar appNavBar;
  final Widget appBody;

  const AppScaffoldChild({
    super.key,
    required this.appNavBar,
    required this.appBody
  });

  @override
  Widget build(BuildContext context) =>
    Column(
      children: [
        appNavBar,
        Expanded(child: appBody)
      ]
    );
}

final class AppNavBar extends StatelessWidget {
  static final double height = 50.w;
  final Widget? leftButton;
  final Widget? title;
  final Widget? rightButton;

  const AppNavBar({
    super.key,
    this.leftButton,
    this.title,
    this.rightButton
  });

  @override
  Widget build(BuildContext context) =>
    Container(
      width: double.infinity,
      height: AppScreenUtil.statusBarHeight + height,
      padding: EdgeInsets.only(top: AppScreenUtil.statusBarHeight),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        border: Border(
          bottom: BorderSide(
            color: context.colors.outline,
            width: 0.5
          )
        )
      ),
      child: Stack(
        children: [
          if (title != null)
            Center(child: title!),
          if (leftButton != null)
            Align(
              alignment: Alignment.centerLeft,
              child: leftButton!
            ),
          if (rightButton != null)
            Align(
              alignment: Alignment.centerRight,
              child: rightButton!
            )
        ]
      )
    );
}

class AppNavBarBackButton extends StatelessWidget {
  final Function() onPressed;
  const AppNavBarBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) =>
    AppButton(
      width: AppNavBar.height,
      height: AppNavBar.height,
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_back_ios,
        size: 28.w,
        color: context.colors.onSurface
      )
    );
}

class AppNavBarTitle extends StatelessWidget {
  final String title;
  const AppNavBarTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) =>
    Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: context.colors.onSurface
      )
    );
}