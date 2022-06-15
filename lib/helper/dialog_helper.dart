// ignore_for_file: constant_identifier_names

import 'package:desktop_base/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

//---------------<Toast>-----------------
class Toast {
  static show(String message) {
    Fluttertoast.showToast(msg: message);
  }
}

//---------------<Loading Dialog>-----------------
class Loading {
  static show() {
    return showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (context) => const LoadingDialog());
  }

  static hide() => Get.back();
}

//---------------<Custom Dialog>-----------------
enum TypeDialog {
  FAILED,
  SUCCESS,
  WARNING,
  SOON,
}

class AppDialog {
  static show({
    required TypeDialog typeDialog,
    String? title,
    required String message,
    required VoidCallback onPress,
    bool? dismissible,
  }) {
    switch (typeDialog) {
      case TypeDialog.FAILED:
        return showDialog(
          barrierDismissible: dismissible ?? true,
          context: Get.context!,
          builder: (context) => DialogAlert.error(
            title: title ?? 'Gagal',
            description: message,
            onConfirm: onPress,
          ),
        );
      case TypeDialog.SUCCESS:
        return showDialog(
          barrierDismissible: dismissible ?? false,
          context: Get.context!,
          builder: (context) => DialogAlert.success(
            title: title ?? 'Berhasil',
            description: message,
            onConfirm: onPress,
          ),
        );
      case TypeDialog.WARNING:
        return showDialog(
          barrierDismissible: dismissible ?? true,
          context: Get.context!,
          builder: (context) => DialogAlert.warning(
            title: title ?? 'Peringatan!',
            description: message,
            onConfirm: onPress,
            onCancel: () => Get.back(),
          ),
        );
      case TypeDialog.SOON:
        return showDialog(
          barrierDismissible: dismissible ?? true,
          context: Get.context!,
          builder: (context) => const SoonDialog(),
        );
    }
  }

  static close() => Get.back();
}
