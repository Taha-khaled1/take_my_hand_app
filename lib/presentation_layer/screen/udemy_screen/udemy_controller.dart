import 'package:take_hand/data_layer/models/udemyFreeCoursesCouponModel.dart';
import 'package:take_hand/data_layer/data_source/udemy_source.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class UdemyFreeCourseController extends GetxController with UdemySource {
  late StatusRequest statusRequest;
  UdemyFreeCoursesCouponModel? udemyFreeCoursesCouponModel;
  var response;
  getUdemyFreeCoursesCouponResponse() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getUdemyFreeCourses();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        udemyFreeCoursesCouponModel =
            await UdemyFreeCoursesCouponModel.fromJson(response);
      }
    } catch (e) {
      HelperFunction.printRedText("==================> ${e}");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    getUdemyFreeCoursesCouponResponse();
    super.onInit();
  }
}
