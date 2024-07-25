import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/article_controller.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/widget/search_field.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/section_header_and_filter.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/college_card.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:take_hand/presentation_layer/utils/view_handlers/view_handlers.dart';

class ArticleScreen extends GetView<ArticleController> {
  const ArticleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<ArticleController>(
              init: ArticleController(),
              builder: (_) {
                return HandlingDataView(
                  statusRequest: _.statusRequest,
                  child: SingleChildScrollView(
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
                                      width: HelperView.widthForTextField(
                                          deviceInfo),
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
                                items: _.articleCards,
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
                          children: List.generate(
                            _.articlesModel?.data?.articleCategories?.length ??
                                0,
                            (index) => CollegeCard(
                              imageWidth: 90,
                              imageHeight: 70,
                              width: 110,
                              height: 120,
                              imageUrl: HelperFunction.imageNetworkCheck(
                                  _.articlesModel!.data!
                                      .articleCategories![index].image,
                                  isUrl: false),
                              collegeName: _.articlesModel!.data!
                                      .articleCategories![index].title ??
                                  "",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
