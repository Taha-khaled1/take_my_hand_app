import 'package:take_hand/domain_layer/models/college_model.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/widget/article_card.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/section_header_and_filter.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/college_card.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/course_card.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/university_header.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                CarouselSliderBanner(
                  items: x,
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
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.universityDetalisScreen);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClayContainer(
                            width: 265,
                            color: ColorManager.background,
                            borderRadius: 20,
                            depth: 10,
                            spread: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                UniversityHeader(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "جامعة النيل الدوليه",
                                        style: MangeStyles().getRegularStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s16,
                                        ),
                                      ),
                                      AppSizedBox.sizedBox_5,
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            initialRating: 3,
                                            itemSize: 22,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            ignoreGestures: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 17,
                                            child: VerticalDivider(
                                              thickness: 2,
                                              color: ColorManager.kPrimary,
                                            ),
                                          ),
                                          Text(
                                            "الكليات (12)",
                                            style:
                                                MangeStyles().getRegularStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/icons/location.png",
                                            height: 25,
                                          ),
                                          AppSizedBox.sizedBox_w5,
                                          Text(
                                            "مصر - المنيا - مركز مطاي",
                                            style:
                                                MangeStyles().getRegularStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                          imageUrl: 'assets/images/pexels-iriser-1366957.jpg',
                          title:
                              'بعض الامثله التي يمكنك تطبيقها مثل الاغاني و العب كرة القدم',
                          date: '21/11/23',
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
                    itemCount: colleges.length > 4 ? 4 : colleges.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: HelperView.childGridView(deviceInfo),
                      childAspectRatio:
                          HelperView.collegeAspectRatio(deviceInfo),
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CollegeCard(
                          imageUrl: colleges[0].imageUrl,
                          collegeName: colleges[0].name,
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
          );
        },
      ),
    );
  }
}

List<CollegeModel> colleges = [
  CollegeModel(
    imageUrl:
        'https://cdn3d.iconscout.com/3d/premium/thumb/medicine-7239919-5889254.png',
    name: 'كلية تجاره',
  ),
  CollegeModel(
    imageUrl:
        'https://cdn3d.iconscout.com/3d/premium/thumb/medicine-7239919-5889254.png',
    name: 'كلية تجاره',
  ),
  CollegeModel(
    imageUrl:
        'https://cdn3d.iconscout.com/3d/premium/thumb/medicine-7239919-5889254.png',
    name: 'كلية تجاره',
  ),
  CollegeModel(
    imageUrl:
        'https://cdn3d.iconscout.com/3d/premium/thumb/medicine-7239919-5889254.png',
    name: 'كلية تجاره',
  ),
];
