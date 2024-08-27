import 'package:cat_facts_flutter/core/controllers/main_controller.dart';
import 'package:cat_facts_flutter/core/utils/storage_utils.dart';
import 'package:cat_facts_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(MainController());
  Get.put(StorageUtils());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final mainController = Get.find<MainController>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Allopet',
          theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onReady: () async {
            await _checkCredentialsAndRedirect();
          },
          initialRoute: Routes.initialRoute,
          getPages: Routes.pages,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }

  Future<void> _checkCredentialsAndRedirect() async {
    final storageUtils = Get.find<StorageUtils>();
    final username = storageUtils.username;
    final password = storageUtils.password;

    if (username.isNotEmpty && password.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 1000));
      Get.offAllNamed(Routes.home);
    } else {
      await Future.delayed(const Duration(milliseconds: 1000));
      Get.offAllNamed(Routes.login);
    }
  }
}
