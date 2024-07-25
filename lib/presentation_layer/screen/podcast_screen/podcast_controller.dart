import 'package:take_hand/data_layer/data_source/podcast_source.dart';
import 'package:take_hand/data_layer/models/podcast_model.dart';
import 'package:take_hand/presentation_layer/screen/podcast_screen/widget/image_card.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class BodcastController extends GetxController with PodcastSource {
  late StatusRequest statusRequest = StatusRequest.loading;
  BodcastModel? podcastModel;
  List<ImageCard> imageCards = [];
  var response;
  getpodcastsResponse() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getPodcastsHome();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        HelperFunction.printRedText("==================> ${response}");
        podcastModel = await BodcastModel.fromJson(response);
        for (var item in podcastModel!.data!.podcastsTop!) {
          imageCards.add(
            ImageCard(
              image: HelperFunction.imageNetworkCheck(item.image, isUrl: true),
              title: '',
              category: "برمجه",
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
    getpodcastsResponse();
    super.onInit();
  }
}
