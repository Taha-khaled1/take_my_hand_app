import 'package:get/get.dart';

class TabAppController extends GetxController {
  int currentIndex = 0;

  void changeTabIndex(int index) {
    currentIndex = index;
    update();
  }
}
