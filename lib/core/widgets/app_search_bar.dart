import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'app_screen_util.dart';
import 'app_button.dart';
import 'app_text_field.dart';

class AppSearchBar extends StatefulWidget {
  static final height = 38.w;
  final String placeholder;
  final TextEditingController? controller;
  final Function(String) onChanged; 

  const AppSearchBar({
    super.key,
    required this.placeholder,
    this.controller,
    required this.onChanged
  });

  @override
  AppSearchBarState createState() => AppSearchBarState();
}

class AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller;
  bool _showClearButton = false;

  void _onChanged(String query) {
    setState(() {
      _showClearButton = query.isNotEmpty;
    });
  }

  void _clearPressed() {
    setState(() {
      _showClearButton = false;
    });
    _controller.clear();
    widget.onChanged('');
  }

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
    Container(
      height: AppSearchBar.height,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: context.colors.outline,
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Icon(
            Icons.search,
            size: 20.w,
            color: context.colors.onSurfaceVariant
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: AppTextField(
              padding: EdgeInsets.symmetric(vertical: (AppSearchBar.height - AppTextField.fontSize) / 2),
              textCapitalization: TextCapitalization.none,
              hintText: widget.placeholder,
              controller: _controller,
              onChanged: _onChanged,
              onSearchSubmitted: widget.onChanged
            )
          ),
          _showClearButton ?
            AppButton(
              width: 40.w,
              borderRadius: BorderRadius.circular(10.r),
              onPressed: _clearPressed,
              child: Icon(
                Icons.cancel,
                size: 20.w,
                color: context.colors.onSurfaceVariant
              )
            ) :
            SizedBox(width: 10.w)
        ]
      )
    );
}