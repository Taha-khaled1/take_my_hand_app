import 'package:take_hand/data_layer/data_source/provider_source.dart';
import 'package:take_hand/data_layer/models/provider_model.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class CoursePlatformsController extends GetxController with ProviderSource {
  late StatusRequest statusRequest;
  ProviderModel? providerModel;
  var response;
  getProviderResponse() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getProviderHome();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        HelperFunction.printRedText("==================> ${response}");
        providerModel = await ProviderModel.fromJson(response);
      }
    } catch (e) {
      HelperFunction.printRedText("==================> ${e}");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() async {
    getProviderResponse();
    super.onInit();
  }
}
