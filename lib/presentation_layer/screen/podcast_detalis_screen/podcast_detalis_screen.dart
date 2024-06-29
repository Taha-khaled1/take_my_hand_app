import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/screen/podcast_detalis_screen/podcast_detalis_controller.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BodcastDetalisScreen extends GetView<BodcastDetalisController> {
  const BodcastDetalisScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("بودكاست"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<BodcastDetalisController>(
            builder: (_) {
              return SingleChildScrollView(
                child: controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          YoutubePlayer(
                            controller: controller.youtubePlayerController,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: const ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent,
                            ),
                            onReady: () {
                              controller.youtubePlayerController
                                  .addListener(() {});
                            },
                          ),
                        ],
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
