import 'package:animation_pro/routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void navigateToLightSaber() {
    Get.toNamed(Routes.LIGHT_SABER);
  }

  void navigateToAnimatedList(){
    Get.toNamed(Routes.ANIMATED_LIST_VIEW);
  }
}
