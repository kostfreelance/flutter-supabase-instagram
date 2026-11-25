import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fsi/core/widgets/app_scaffold.dart';
import 'package:fsi/features/post/presentation/screens/post_add_screen.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';
import 'app_action_sheet.dart';

class AppTabs extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppTabs({
    super.key,
    required this.navigationShell
  });

  void _pickImage(
    BuildContext context,
    ImageSource imageSource
  ) async {
    XFile? pickedImage = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 100,
      maxWidth: 750
    );
    if (pickedImage != null && context.mounted) {
      context.push(
        '${PostAddScreen.path}?fileType=image&'
        'filePath=${Uri.encodeComponent(pickedImage.path)}'
      );
    }
  }

  void _pickVideo(
    BuildContext context,
    ImageSource videoSource
  ) async {
    XFile? pickedVideo = await ImagePicker().pickVideo(
      source: videoSource,
      maxDuration: const Duration(seconds: 10)
    );
    if (pickedVideo != null && context.mounted) {
      context.push(
        '${PostAddScreen.path}?fileType=video&'
        'filePath=${Uri.encodeComponent(pickedVideo.path)}'
      );
    }
  }

  void _onTabPressed(
    BuildContext context, {
      required int tabIndex,
      required int postAddScreenIndex
  }) {
    if (tabIndex == postAddScreenIndex) {
      AppActionSheet.open(
        context,
        items: [
          AppActionSheetItem(
            'Take Photo',
            onPressed: () => _pickImage(context, ImageSource.camera)
          ), 
          AppActionSheetItem(
            'Photo from Library',
            onPressed: () => _pickImage(context, ImageSource.gallery)
          ), 
          AppActionSheetItem(
            'Take Video (10 secs)',
            onPressed: () => _pickVideo(context, ImageSource.camera)
          ), 
          AppActionSheetItem(
            'Video from Library (10 secs)',
            onPressed: () => _pickVideo(context, ImageSource.gallery)
          )
        ]
      );
    } else {
      tabIndex = tabIndex > postAddScreenIndex ?
        tabIndex - 1 : tabIndex;
      navigationShell.goBranch(
        tabIndex,
        initialLocation: tabIndex == navigationShell.currentIndex
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int postAddScreenIndex = 2;
    return AppScaffold(
      appBody: navigationShell,
      appBottomNavigationBar: Container(
        height: 45.w + AppScreenUtil.bottomBarHeight,
        padding: EdgeInsets.only(bottom: AppScreenUtil.bottomBarHeight),
        color: context.colors.surfaceContainerLow,
        child: Row(
          children: [
            Icons.home,
            Icons.search,
            Icons.add_a_photo,
            Icons.question_answer,
            Icons.person
          ].asMap().entries.map((e) {
            bool selected = e.key != postAddScreenIndex &&
              (e.key > postAddScreenIndex ?
              e.key - 1 == navigationShell.currentIndex :
              e.key == navigationShell.currentIndex);
            return Expanded(
              child: GestureDetector(
                onTap: () =>
                  _onTabPressed(
                    context,
                    tabIndex: e.key,
                    postAddScreenIndex: postAddScreenIndex
                  ),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Icon(
                      e.value,
                      size: 25.w,
                      color: selected ?
                        context.colors.onSurface :
                        context.colors.onSurfaceVariant
                    )
                  )
                )
              )
            );
          }).toList()
        )
      )
    );
  }
}