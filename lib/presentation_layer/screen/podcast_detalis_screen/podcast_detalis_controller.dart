import 'package:take_hand/data_layer/data_source/podcast_source.dart';
import 'package:take_hand/data_layer/models/podcast_detalis_model.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BodcastDetalisController extends GetxController with PodcastSource {
  YoutubePlayerController? youtubePlayerController;
  late StatusRequest statusRequest = StatusRequest.loading;
  PodcastDetalisModel? podcastDetalisModel;
  var response;
  final int? id = Get.arguments["id"];
  getpodcastsDetailsResponse() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getPodcastDetails(id!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        podcastDetalisModel = await PodcastDetalisModel.fromJson(response);
        HelperFunction.printRedText(
            "========${podcastDetalisModel!.data!.podcast!.youtubeUrl!}==========> ${response}");
        getOpenVideo(podcastDetalisModel!.data!.podcast!.youtubeUrl!);
      }
    } catch (e) {
      HelperFunction.printRedText("==================> ${e}");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  void getOpenVideo(String url) async {
    podcastDetalisModel = await PodcastDetalisModel.fromJson(response);
    final videoId = await YoutubePlayer.convertUrlToId(
      url,
    );

    youtubePlayerController = await YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void onInit() async {
    getpodcastsDetailsResponse();
    super.onInit();
  }
}
