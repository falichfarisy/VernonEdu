import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vernon_edu/routes/routes.dart';
import 'package:vernon_edu/widgets/shared/constants/storage.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(seconds: 3));
    var storage = Get.find<SharedPreferences>();

    await storage.remove(StorageConstants.token);

    try {
      if (storage.getString(StorageConstants.token) != null) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.auth);
      }
    } catch (e) {
      Get.offAllNamed(Routes.auth);
    }
  }
}
