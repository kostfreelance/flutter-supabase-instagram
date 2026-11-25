import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Widget leading;
  final Widget title;
  final Widget? subTitle;
  final Widget? trailing;
  final Function() onPressed;

  const AppListTile({
    super.key,
    this.padding,
    this.height,
    required this.leading,
    required this.title,
    this.subTitle,
    this.trailing,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) =>
    InkWell(
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        height: height,
        padding: padding,
        child: Row(
          children: [
            leading,
            Expanded(
              child: Column(
                mainAxisAlignment: subTitle != null ?
                  MainAxisAlignment.spaceEvenly :
                  MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  ?subTitle
                ]
              )
            ),
            ?trailing
          ]
        )
      )
    );
}