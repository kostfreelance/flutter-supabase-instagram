import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'app_screen_util.dart';

abstract class AppActionSheet {
  static void open(
    BuildContext context, {
      required List<AppActionSheetItem> items
  }) {
    TextStyle textStyle = TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: 20.sp
    );
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
        CupertinoActionSheet(
          actions: items.map((item) =>
            CupertinoActionSheetAction(
              child: Text(
                item.text,
                style: textStyle
              ),
              onPressed: () {
                context.pop();
                item.onPressed();
              }
            )
          ).toList(),
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: context.pop,
            child: Text(
              'Cancel',
              style: textStyle
            )
          )
        )
    );
  }
}

class AppActionSheetItem {
  final String text;
  final Function() onPressed;

  AppActionSheetItem(
    this.text, {
      required this.onPressed
  });
}