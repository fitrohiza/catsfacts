import 'package:cat_facts_flutter/core/constant/screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:package_info_plus/package_info_plus.dart';

class MainController extends GetxController {
  bool isPhone = false;
  bool isTablet = false;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  var appName = "".obs;
  var packageName = "".obs;
  var version = "".obs;
  var buildNumber = "".obs;

  void getDeviceInfo() async {
    androidInfo = await deviceInfo.androidInfo;
    // package_info_plus
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName.value = packageInfo.appName;
    packageName.value = packageInfo.packageName;
    version.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
  }

  String getScreen(String page) {
    var screens = ListScreen.get;
    String type = getScreenType();
    String routeName;
    switch (type) {
      case 'tablet':
        {
          routeName = screens['tablet']![page] ?? "/404";
        }
        break;
      case 'mobile':
        {
          routeName = screens['mobile']![page] ?? "/404";
        }
        break;
      default:
        {
          routeName = screens['mobile']![page] ?? "/404";
        }
        break;
    }

    return routeName;
  }

  String getScreenType() {
    String screen = "mobile";

    if (isTablet) {
      screen = "tablet";
    }

    return screen;
  }
}
