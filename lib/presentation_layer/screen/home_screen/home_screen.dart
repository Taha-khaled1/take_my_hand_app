import 'package:take_hand/presentation_layer/screen/article_screen/widget/article_card.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/section_header_and_filter.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/home_controller.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/college_card.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/course_card.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/university_card.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:take_hand/presentation_layer/utils/view_handlers/view_handlers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<HomeController>(
              init: HomeController(),
              builder: (_) {
                return HandlingDataView(
                  statusRequest: _.statusRequest,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        CarouselSliderBanner(
                          items: _.banners,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SectionHeaderAndFilter(
                          is_more: true,
                          title: 'الجامعات',
                          press: () {},
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return UniversityCard(
                                  id: _.homeModel?.data?.universities![index]
                                          .id ??
                                      1,
                                  location: _.homeModel?.data
                                      ?.universities![index].address,
                                  imageUrl: _.homeModel?.data
                                      ?.universities![index].logo,
                                  number_of_college: _.homeModel?.data
                                      ?.universities![index].totalColleges
                                      .toString(),
                                  titel: _.homeModel?.data?.universities![index]
                                      .title,
                                  images: HelperFunction.StringTolist(
                                    _.homeModel?.data?.universities![index]
                                            .images ??
                                        "",
                                  )

                                  // reate: ,
                                  );
                            },
                          ),
                        ),
                        SectionHeaderAndFilter(
                          is_more: true,
                          title: 'المقالات',
                          press: () {},
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsetsDirectional.only(start: 8),
                                child: ArticleCard(
                                  id: _.homeModel?.data?.articles![index].id ??
                                      1,
                                  imageUrl: HelperFunction.imageNetworkCheck(
                                    _.homeModel?.data?.articles![index].image,
                                    isUrl: true,
                                  ),
                                  title: _.homeModel?.data?.articles![index]
                                          .title ??
                                      "",
                                  date: _.homeModel?.data?.articles![index]
                                          .createdAt ??
                                      "",
                                  readTime: 10,
                                ),
                              );
                            },
                          ),
                        ),
                        SectionHeaderAndFilter(
                          is_more: true,
                          title: 'الكليات',
                          press: () {},
                        ),
                        SizedBox(
                          height: 400,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                _.homeModel?.data?.careersCollege?.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  HelperView.childGridView(deviceInfo),
                              childAspectRatio:
                                  HelperView.collegeAspectRatio(deviceInfo),
                            ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CollegeCard(
                                  imageUrl: HelperFunction.imageNetworkCheck(
                                    _.homeModel?.data?.careersCollege![index]
                                        .image,
                                  ),
                                  collegeName: _.homeModel?.data
                                          ?.careersCollege![index].title ??
                                      "",
                                ),
                              );
                            },
                          ),
                        ),
                        SectionHeaderAndFilter(
                          is_more: true,
                          title: 'المجالات',
                          press: () {},
                        ),
                        SizedBox(
                          height: 400,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _.homeModel?.data?.careersField?.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  HelperView.childGridView(deviceInfo),
                              childAspectRatio:
                                  HelperView.collegeAspectRatio(deviceInfo),
                            ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CollegeCard(
                                  imageUrl: HelperFunction.imageNetworkCheck(
                                    _.homeModel?.data?.careersField![index]
                                        .image,
                                  ),
                                  collegeName: _.homeModel?.data
                                          ?.careersField![index].title ??
                                      "",
                                ),
                              );
                            },
                          ),
                        ),
                        SectionHeaderAndFilter(
                          is_more: true,
                          title: 'الدورات',
                          press: () {},
                        ),
                        Transform.translate(
                          offset: const Offset(0, 0),
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return const CourseCardRectangular();
                            },
                          ),
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
