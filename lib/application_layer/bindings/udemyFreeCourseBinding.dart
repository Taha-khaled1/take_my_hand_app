import 'package:take_hand/presentation_layer/screen/udemy_screen/udemy_controller.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';

class UdemyFreeCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UdemyFreeCourseController>(() => UdemyFreeCourseController());
  }
}
