import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentWrapper extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Widget? floatingActionButton;
  final bool? canBack;
  final VoidCallback? onPress;
  final List<Widget>? action;

  const ContentWrapper({
    Key? key,
    required this.child,
    this.title = "",
    this.floatingActionButton,
    this.canBack = true,
    this.onPress,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          (context.isDarkMode) ? AppColors.baseDark : AppColors.baseLight,
      floatingActionButton: floatingActionButton,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(
          title: title!,
          action: action,
          canBack: canBack,
          onPress: onPress ?? () => Navigator.pop(context),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          AppConst.defaultMargin,
          0,
          AppConst.defaultMargin,
          AppConst.defaultMargin,
        ),
        child: child,
      ),
    );
  }
}
