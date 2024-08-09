import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:take_hand/application_layer/utils/handling.dart';
import 'package:take_hand/application_layer/utils/statusrequst.dart';
import 'package:take_hand/data_layer/data_source/home_source.dart';
import 'package:take_hand/data_layer/models/home_model.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class HomeController extends GetxController with HomeSource {
  late StatusRequest statusRequest;
  final CarouselController carouselController = CarouselController();
  int current = 0;
  HomeModel? homeModel;
  var response;
  List<BannerCard> banners = [];
  getHomeResponse() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getHome();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        HelperFunction.printRedText("==================> ${response}");
        homeModel = await HomeModel.fromJson(response);
        for (var item in homeModel!.data!.banners!) {
          banners.add(
            BannerCard(
              image: HelperFunction.imageNetworkCheck(item.image!),
              text: '',
            ),
          );
        }
      }
    } catch (e) {
      HelperFunction.printRedText("==================> ${e}");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() async {
    await getHomeResponse();

    super.onInit();
  }
}
