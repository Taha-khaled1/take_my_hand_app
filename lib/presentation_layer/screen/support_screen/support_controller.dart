import 'package:get/get.dart';

class SupportController extends GetxController {
  SupportController();

  String selectedValue = "مشكله تواجهها";
  changeValue(String value) {
    selectedValue = value;
    update();
  }
}
