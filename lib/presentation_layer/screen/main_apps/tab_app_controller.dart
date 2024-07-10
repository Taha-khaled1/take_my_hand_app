import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class TabAppController extends GetxController {
  int currentIndex = 0;
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }

  void changeTabIndex(int index) {
    currentIndex = index;
    update();
  }
}
