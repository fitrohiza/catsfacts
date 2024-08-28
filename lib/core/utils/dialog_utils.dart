import 'package:cat_facts_flutter/ui/widget/info_dialog.dart';
import 'package:cat_facts_flutter/ui/widget/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static bool isLoadingOpen = false;

  static void showChoose(
    String message,
    String buttonText, {
    Function? onClick,
    bool closeOnOk = true,
    bool closePreDialog = false,
  }) {
    if (closePreDialog) closeDialog();
    Get.dialog(
      InfoDialog(
        text: message,
        onClickOK: () {
          if (onClick != null) {
            if (closeOnOk) {
              Get.back();
            }
            onClick();
          } else {
            Get.back();
          }
        },
        icon: Icons.check,
        onClickCancel: () => Get.back(),
        clickText: buttonText,
      ),
      barrierDismissible: false,
    );
  }

  static void showLoading(
    String message, {
    bool closePreDialog = false,
  }) {
    isLoadingOpen = true;
    if (closePreDialog) closeDialog();
    Get.dialog(
      LoadingDialog(text: message),
      barrierDismissible: false,
    );
  }

  static void closeDialog() {
    isLoadingOpen = false;
    Get.back();
  }
}
