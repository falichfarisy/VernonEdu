import 'package:get/get.dart';
import 'package:vernon_edu/pages/home/home_page.dart';
import 'package:vernon_edu/pages/login/login_page.dart';
import 'package:vernon_edu/pages/splash/splash.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreenPage(),
      binding: SplashBinding(),
    ),
    GetPage(name: Routes.auth, page: () => LoginPage(),),
    GetPage(name: Routes.home, page: () => HomePage()),
  ];
}
