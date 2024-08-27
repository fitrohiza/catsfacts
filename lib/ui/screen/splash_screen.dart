import 'package:cat_facts_flutter/core/constant/constant.dart';
import 'package:cat_facts_flutter/core/controllers/main_controller.dart';
import 'package:cat_facts_flutter/core/utils/printlog_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

Widget _logo() {
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Image.asset(
        "assets/images/logo.png",
        width: 150,
      ));
}

class SplashScreenState extends State<SplashScreen> {
  final mainController = Get.find<MainController>();

  @override
  void initState() {
    super.initState();

    final context = Get.context;
    mainController.isPhone = context!.isPhone;
    mainController.isTablet = context.isTablet;
    printLog('context isPhone: ${mainController.isPhone}');
    printLog('context isTablet: ${mainController.isTablet}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_logo()],
            ),
          ),
        ],
      ),
    );
  }
}
