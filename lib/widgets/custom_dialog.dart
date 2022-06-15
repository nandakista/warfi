import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;

  const CustomDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Wrap(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: (context.isDarkMode) ? Colors.black : Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                        color:
                        (context.isDarkMode) ? AppColors.primary : Colors.black,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 10.0)
                  ],
                ),
                child: child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.systemBlack,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                  color: (context.isDarkMode) ? AppColors.primary : Colors.black26,
                  offset: const Offset(0.0, 2.0),
                  blurRadius: 10.0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading',
              style: AppStyle.title4.copyWith(color: Colors.white),
            ),
            const SpinKitThreeBounce(size: 35, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

class DialogAlert extends StatelessWidget {
  final String title, description;
  final VoidCallback? onConfirm, onCancel;
  final Color confirmColor, cancelColor;
  final Widget? header;
  final Color? backgroundColorHeader;

  const DialogAlert({
    Key? key,
    required this.title,
    required this.description,
    required this.header,
    required this.onConfirm,
    required this.backgroundColorHeader,
    this.onCancel,
    this.confirmColor = AppColors.primary,
    this.cancelColor = Colors.red,
  }) : super(key: key);

  factory DialogAlert.success({
    required String title,
    required String description,
    Widget? imageOrAnim,
    required VoidCallback onConfirm,
  }) =>
      DialogAlert(
        title: title,
        description: description,
        header: Lottie.asset('assets/anim/anim_success.json', repeat: false),
        onConfirm: onConfirm,
        backgroundColorHeader: Colors.green[50],
      );

  factory DialogAlert.error({
    required String title,
    required String description,
    Widget? header,
    required VoidCallback onConfirm,
  }) =>
      DialogAlert(
        title: title,
        description: description,
        header: Lottie.asset('assets/anim/anim_failed.json', repeat: false),
        onConfirm: onConfirm,
        backgroundColorHeader: Colors.red[100],
      );

  factory DialogAlert.warning({
    required String title,
    required String description,
    Widget? header,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) =>
      DialogAlert(
        title: title,
        description: description,
        header: Lottie.asset('assets/anim/anim_warning.json', repeat: false),
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmColor: Colors.green,
        backgroundColorHeader: Colors.orangeAccent,
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Wrap(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  color: (context.isDarkMode) ? Colors.black : Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                        color:
                            (context.isDarkMode) ? AppColors.primary : Colors.black,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 10.0)
                  ]),
              child: Column(
                children: [
                  Text(
                    title,
                    style: AppStyle.title2.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: (onCancel != null),
                        child: Flexible(
                          flex: 1,
                          child: CustomButton(
                            text: 'Kembali',
                            color: cancelColor,
                            onPress: onCancel,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomButton(
                          text: 'OK',
                          color: confirmColor,
                          onPress: onConfirm,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
          Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: backgroundColorHeader,
              radius: 50,
              child: header,
            ),
          )
        ],
      ),
    );
  }
}

class SoonDialog extends StatelessWidget {
  const SoonDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            width: 200,
            child: Lottie.asset('assets/anim/anim_soon.json'),
          ),
          Text(
            'COMING SOON',
            style: AppStyle.headline2,
          ),
          Text(
            'Fitur ini lagi dikembangin..',
            style: AppStyle.subtitle4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomButton(
              onPress: () => Get.back(),
              text: 'OK',
              color: AppColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
