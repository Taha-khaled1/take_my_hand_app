import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/article_controller.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/widget/article_card.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/widget/search_field.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/section_header_and_filter.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/college_card.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class ArticleScreen extends GetView<ArticleController> {
  const ArticleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
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
                            "assets/images/pexels-iriser-1366957.jpg",
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 90,
                            child: SizedBox(
                              width: HelperView.widthForTextField(deviceInfo),
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
                          ArticleCard(
                            imageUrl: 'assets/images/pexels-iriser-1366957.jpg',
                            title:
                                'بعض الامثله التي يمكنك تطبيقها مثل الاغاني و العب كرة القدم',
                            date: '21/11/23',
                            readTime: 10,
                          ),
                          ArticleCard(
                            imageUrl: 'assets/images/pexels-iriser-1366957.jpg',
                            title:
                                'بعض الامثله التي يمكنك تطبيقها مثل الاغاني و العب كرة القدم',
                            date: '21/11/23',
                            readTime: 10,
                          ),
                          ArticleCard(
                            imageUrl: 'assets/images/pexels-iriser-1366957.jpg',
                            title:
                                'بعض العب  العبا لعب الامثله التي يمكنك تطبيقها مثل الاغاني و العب كرة القدم',
                            date: '21/11/23',
                            readTime: 10,
                          ),
                        ],
                        height: 285,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.67,
                        enlargeFactor: 0.08,
                        callbackFunction: (index, reason) {
                          print(index);
                        },
                      ),
                    ),
                  ],
                ),
                AppSizedBox.sizedBox_10,
                SectionHeaderAndFilter(
                  is_more: true,
                  title: 'الاقسام',
                  press: () {},
                ),
                AppSizedBox.sizedBox_10,
                Wrap(
                  spacing: deviceInfo.localWidth * 0.04,
                  runSpacing: 10,
                  children: [
                    for (int i = 0; i < 15; i++)
                      CollegeCard(
                        imageWidth: 90,
                        imageHeight: 70,
                        width: 110,
                        height: 120,
                        imageUrl: colleges[0].imageUrl,
                        collegeName: colleges[0].name,
                      ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
