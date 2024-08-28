import 'package:cat_facts_flutter/core/utils/dialog_utils.dart';
import 'package:cat_facts_flutter/core/utils/storage_utils.dart';
import 'package:cat_facts_flutter/ui/screen/home/home_screen.dart';
import 'package:cat_facts_flutter/ui/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final StorageUtils _storageUtils = Get.find<StorageUtils>();

  void login(String username, String password) async {
    DialogUtils.showLoading("Signing In...");

    if (username.isNotEmpty && password.isNotEmpty) {
      _storageUtils.username = username;
      _storageUtils.password = password;
      await Future.delayed(const Duration(seconds: 3));

      DialogUtils.closeDialog();
      Get.offAll(() => const HomeScreen());
    } else {
      DialogUtils.closeDialog();
      Get.snackbar(
        "Login Failed",
        "Please enter both username and password",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void logout() {
    DialogUtils.showChoose("Do you want to logout?", "Logout", onClick: () {
      _storageUtils.clearSession();
      Get.offAll(() => const LoginScreen());
    });
  }
}
