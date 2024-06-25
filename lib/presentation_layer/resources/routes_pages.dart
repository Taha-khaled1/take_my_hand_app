import 'package:take_hand/application_layer/bindings/udemyFreeCourseBinding.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:get/get.dart';

import 'package:take_hand/presentation_layer/screen/main_apps/main_app.dart';
import 'package:take_hand/presentation_layer/screen/udemy_screen/udemy_screen.dart';

List<GetPage<dynamic>>? getPage = [
  GetPage(
    name: Routes.startpage,
    page: () => const NavBarHome(),
  ),
  GetPage(
    name: Routes.udemyFreeCourse,
    page: () => const UdemyScreen(),
    binding: UdemyFreeCourseBinding(),
  ),
];
  // GetPage(
  //     name: Routes.startpage,
  //     page: () => const LoginScreen(),
  //     binding: BindingsBuilder(() {
  //       Get.lazyPut<LoginController>(() => LoginController());
  //     }),
  //     middlewares: [
  //       Midelware(),
  //     ]),