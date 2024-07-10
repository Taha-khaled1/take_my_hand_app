import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/section_header_and_filter.dart';
import 'package:take_hand/presentation_layer/screen/podcast_detalis_screen/podcast_detalis_controller.dart';
import 'package:take_hand/presentation_layer/screen/podcast_screen/widget/podcast_card.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/university_detalis_screen.dart';
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
      // bottomNavigationBar: Container(
      //   // margin:
      //   //     const EdgeInsets.only(right: 100, left: 100, bottom: 20, top: 10),
      //   // alignment: Alignment.center,
      //   width: 100,
      //   height: 50,
      //   decoration: BoxDecoration(
      //     color: ColorManager.backgroundpersonalimage,
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       AppSizedBox.sizedBox_w10,
      //       GestureDetector(
      //         onTap: () {},
      //         child: const Padding(
      //           padding: EdgeInsets.all(8.0),
      //           child: Icon(
      //             LineIcons.heart,
      //             size: 30,
      //             color: ColorManager.kPrimary,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 28,
      //         child: VerticalDivider(
      //           thickness: 2,
      //           color: ColorManager.kTextgray,
      //         ),
      //       ),
      //       Icon(
      //         Icons.share,
      //         size: 30,
      //         color: ColorManager.kgold,
      //       ),
      //       AppSizedBox.sizedBox_w10,
      //     ],
      //   ),
      // ),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<BodcastDetalisController>(
            builder: (_) {
              return SingleChildScrollView(
                child: controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          Column(
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "عم حربي يفحم المذيعة الزملكاوية إزاي ال 7 أكبر من ال 9 في قضية نادي القرن الحكيكي",
                                  style: MangeStyles().getSemiBoldStyle(
                                    color: Colors.white,
                                    fontSize: FontSize.s17,
                                  ),
                                ),
                              ),
                              CustomCardWidget(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 8,
                                ),
                                child: ReadMoreText(
                                  text:
                                      "hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world",
                                ),
                              ),
                              SectionHeaderAndFilter(
                                is_more: true,
                                title: 'المقالات',
                                press: () {},
                              ),
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return PodcastCard(
                                    imageUrl:
                                        'https://willcwood.scusd.edu/sites/main/files/imagecache/lightbox/main-images/camera_lense_0.jpeg',
                                    title:
                                        "عم حربي يفحم المذيعة الزملكاوية إزاي ال 7 أكبر من ال 9 في قضية نادي القرن الحكيكي",
                                    date: "2023/02/02",
                                    creator: "taha khaled",
                                    platformLogo: "assets/icons/youtube.png",
                                  );
                                },
                              ),
                            ],
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

class CustomCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.backgroundpersonalimage,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.backgroundpersonalimage,
            backgroundImage: AssetImage(
              'assets/icons/youtube.png',
            ), // Replace with your image URL
            radius: 30,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PewDiePie',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '2023/02/02',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.verified,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
