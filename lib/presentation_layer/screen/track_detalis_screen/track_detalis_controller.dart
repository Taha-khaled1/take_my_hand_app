import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class TrackDetalisController extends GetxController {
  Color intialButtonColor = Colors.red;
  List<Color> colorsButton = [
    Colors.red,
    Colors.teal,
    Colors.orangeAccent,
    Colors.purple,
    Colors.limeAccent,
    Colors.cyan,
    Colors.black,
    Colors.brown,
    Colors.indigo,
  ];

  @override
  void onInit() {
    intialButtonColor = colorsButton[Random().nextInt(colorsButton.length)];
    Timer.periodic(Duration(seconds: 2), (timer) {
      intialButtonColor = colorsButton[Random().nextInt(colorsButton.length)];
      update();
    });
    super.onInit();
  }
}
