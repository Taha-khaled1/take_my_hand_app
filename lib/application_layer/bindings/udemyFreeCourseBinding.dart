import 'package:take_hand/presentation_layer/screen/article_detalis_screen/article_detalis_controller.dart';
import 'package:take_hand/presentation_layer/screen/chatbot_screen/chatbot_controller.dart';
import 'package:take_hand/presentation_layer/screen/podcast_detalis_screen/podcast_detalis_controller.dart';
import 'package:take_hand/presentation_layer/screen/udemy_screen/udemy_controller.dart';
import 'package:take_hand/presentation_layer/screen/university_college_screen/university_college_controller.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/university_detalis_controller.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';

class UdemyFreeCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UdemyFreeCourseController>(() => UdemyFreeCourseController());
  }
}

class UniversityDetalisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UniversityDetalisController>(
        () => UniversityDetalisController());
  }
}

class UniversityCollegeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UniversityCollegeController>(
        () => UniversityCollegeController());
  }
}

class ChatbotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatbotController>(() => ChatbotController());
  }
}

class ArticleDetalisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleDetalisController>(() => ArticleDetalisController());
  }
}

class BodcastDetalisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BodcastDetalisController>(() => BodcastDetalisController());
  }
}
