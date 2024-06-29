import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BodcastDetalisController extends GetxController {
  bool isLoading = true;
  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() async {
    final videoId = await YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/shorts/UByOK0Ns3jk",
    );

    youtubePlayerController = await YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        // mute: true,
      ),
    );
    isLoading = false;
    update();

    super.onInit();
  }
}
