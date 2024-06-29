import 'package:take_hand/presentation_layer/screen/article_screen/widget/search_field.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/section_header_and_filter.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/screen/podcast_screen/podcast_controller.dart';
import 'package:take_hand/presentation_layer/screen/podcast_screen/widget/image_card.dart';
import 'package:take_hand/presentation_layer/screen/podcast_screen/widget/podcast_card.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class BodcastScreen extends GetView<BodcastController> {
  const BodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<BodcastController>(
            init: BodcastController(),
            builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: 452,
                          color: ColorManager.background,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/podcast.jpg",
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 90,
                                child: SizedBox(
                                  width:
                                      HelperView.widthForTextField(deviceInfo),
                                  // width: deviceInfo.screenWidth * 0.9,
                                  child: SearchField(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: CarouselSliderBanner(
                            items: [
                              ImageCard(),
                              ImageCard(),
                              ImageCard(),
                              ImageCard(),
                              ImageCard(),
                            ],
                            height: 285,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.55,
                            enlargeFactor: 0.08,
                            callbackFunction: (index, reason) {
                              print(index);
                            },
                          ),
                        ),
                      ],
                    ),
                    SectionHeaderAndFilter(
                      is_more: true,
                      title: 'المقالات',
                      press: () {},
                    ),
                    Transform.translate(
                      offset: Offset(0, -30),
                      child: ListView.builder(
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
