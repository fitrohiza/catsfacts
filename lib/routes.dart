import 'package:cat_facts_flutter/ui/screen/home/home_screen.dart';
import 'package:cat_facts_flutter/ui/screen/login/login_screen.dart';
import 'package:cat_facts_flutter/ui/screen/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const initialRoute = SplashScreen.routeName;
  static final pages = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
        transition: Transition.cupertino,
        name: login,
        page: () => const LoginScreen()),
    GetPage(
        transition: Transition.cupertino,
        name: home,
        page: () => const HomeScreen()),
  ];

  static String home = '/home';
  static String login = '/login';
}
