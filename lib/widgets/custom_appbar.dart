import 'package:desktop_base/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final Color? backgroundColor, textColor;
  final VoidCallback onPress;
  final String title;
  final bool? canBack;
  final List<Widget>? action;

  const CustomAppBar({
    Key? key,
    required this.onPress,
    this.title = "",
    this.backgroundColor,
    this.textColor,
    this.action,
    this.canBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
          color: (textColor == null)
              ? (context.isDarkMode)
                  ? Colors.white
                  : Colors.black
              : textColor,
          fontSize: 24,
        ),
      ),
      backgroundColor:
          (context.isDarkMode) ? AppColors.baseDark : AppColors.baseLight,
      elevation: 0,
      leading: (canBack!)
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onPress,
                iconSize: 24,
                color: (context.isDarkMode) ? Colors.white : Colors.black,
              ),
            )
          : Container(),
      actions: action,
    );
  }
}
