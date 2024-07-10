import 'package:take_hand/application_layer/bindings/udemyFreeCourseBinding.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/screen/article_detalis_screen/article_detalis_screen.dart';
import 'package:take_hand/presentation_layer/screen/chatbot_screen/chatbot_screen.dart';
import 'package:take_hand/presentation_layer/screen/classcentral_screen/classcentral_screen.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/main_app.dart';
import 'package:take_hand/presentation_layer/screen/podcast_detalis_screen/podcast_detalis_screen.dart';
import 'package:take_hand/presentation_layer/screen/udemy_screen/udemy_screen.dart';
import 'package:take_hand/presentation_layer/screen/university_college_screen/university_college_screen.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/university_detalis_screen.dart';

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
  GetPage(
    name: Routes.universityDetalisScreen,
    page: () => const UniversityDetalisScreen(),
    binding: UniversityDetalisBinding(),
  ),
  GetPage(
    name: Routes.universityCollegeScreen,
    page: () => const UniversityCollegeScreen(),
    binding: UniversityCollegeBinding(),
  ),
  GetPage(
    name: Routes.chatbotScreen,
    page: () => const ChatbotScreen(),
    binding: ChatbotBinding(),
  ),
  GetPage(
    name: Routes.articleDetalis,
    page: () => const ArticleDetalisScreen(),
    binding: ArticleDetalisBinding(),
  ),
  GetPage(
    name: Routes.podcastDetalis,
    page: () => const BodcastDetalisScreen(),
    binding: BodcastDetalisBinding(),
  ),
  GetPage(
    name: Routes.classcentral,
    page: () => const ClassCentralScreen(),
    binding: ClassCentralBinding(),
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