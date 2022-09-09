import 'package:animation_pro/controller/animated_list_controller.dart';
import 'package:animation_pro/routes/routes.dart';
import 'package:animation_pro/views/animated_list_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../controller/home_controller.dart';
import '../controller/lightsaber_controller.dart';
import '../views/home_view.dart';
import '../views/lightsaber_view.dart';

class AppRouter {
  static const String INIT = Routes.HOME;

  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder((){
        Get.lazyPut<HomeController>(() => HomeController());
      })
    ),

    GetPage(
      name: Routes.LIGHT_SABER,
      page: () => const LightSaberView(),
      binding: BindingsBuilder((){
        Get.lazyPut<LightsaberController>(() => LightsaberController());
      })
    ),

    GetPage(
      name: Routes.ANIMATED_LIST_VIEW,
      page: () => const AnimatedListView(),
      binding: BindingsBuilder((){
        Get.lazyPut<AnimatedListController>(() => AnimatedListController());
      })
    ),
  ];
}
