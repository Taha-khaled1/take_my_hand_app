import 'package:get/get.dart';
import 'package:take_hand/application_layer/utils/handling.dart';
import 'package:take_hand/application_layer/utils/statusrequst.dart';
import 'package:take_hand/data_layer/data_source/university_source.dart';
import 'package:take_hand/data_layer/models/university_model_detalis.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class UniversityDetalisController extends GetxController with UniversitySource {
  bool isExpanded = false;

  void toggleExpansion() {
    isExpanded = !isExpanded;
    update();
  }

  late StatusRequest statusRequest = StatusRequest.loading;
  UniversityDetalisModel? universityDetalisModel;
  var response;
  final int? id = Get.arguments["id"] ?? 1;
  getUniversityDetalisResponse() async {
    try {
      HelperFunction.printRedText("==================> ${id}");
      response = await getUniversityDetalis(id!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        HelperFunction.printRedText("==================> ${response}");
        universityDetalisModel =
            await UniversityDetalisModel.fromJson(response);
      }
    } catch (e) {
      HelperFunction.printRedText("==================> ${e}");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() async {
    HelperFunction.printCyanText("==================> ${id}");
    getUniversityDetalisResponse();
    super.onInit();
  }
}
