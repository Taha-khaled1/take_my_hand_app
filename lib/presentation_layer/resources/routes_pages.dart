import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/main_app.dart';

List<GetPage<dynamic>>? getPage = [
  // GetPage(
  //     name: Routes.startpage,
  //     page: () => const LoginScreen(),
  //     binding: BindingsBuilder(() {
  //       Get.lazyPut<LoginController>(() => LoginController());
  //     }),
  //     middlewares: [
  //       Midelware(),
  //     ]),
  GetPage(
    name: Routes.startpage,
    page: () => const NavBarHome(),
  ),
];
