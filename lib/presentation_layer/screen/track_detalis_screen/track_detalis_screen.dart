import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/favorite_screen/favorite_screen.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/book_card.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/book_row.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/road_map_image.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class TrackDetalisScreen extends StatelessWidget {
  const TrackDetalisScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(ImageAssets.testImage),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const RoadMapImage(),
                  TitleWidget(
                    title: "المدرسين",
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: UserInfoWidget(
                            userName: 'John Doe',
                            userSpecialty: 'Software Developer',
                            userEvaluation: '4.5/5',
                            userImage: 'https://example.com/user.jpg',
                          ),
                        );
                      },
                    ),
                  ),
                  TitleWidget(
                    title: "دورات خاصه بالمجال",
                  ),
                  SizedBox(
                    height: 280,
                    // width: ,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 200,
                          child: CourseCardSqure(
                            imageUrl:
                                "https://mrwallpaper.com/images/hd/cool-profile-pictures-panda-man-gsl2ntkjj3hrk84s.jpg",
                            title: "udemy Free",
                            isFree: true,
                            evaluation: 4.0,
                            trackName: "program",
                            price: "400",
                            discountedPrice: "0.0",
                          ),
                        );
                      },
                    ),
                  ),
                  TitleWidget(
                    title: "كتب خاصه بالمجال",
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return BookCard(
                          image: "assets/images/downlo0ad.png",
                          name: "كود نظيف",
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      ClayContainer(
                        color: ColorManager.backgroundpersonalimage,
                        width: 200,
                        height: 200,
                        borderRadius: 15,
                        spread: 1.5,
                        depth: 15,
                        curveType: CurveType.concave,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "View the path in app",
                                style: MangeStyles().getSemiBoldStyle(
                                  color: ColorManager.grey2,
                                  fontSize: 14,
                                ),
                              ),
                              AppSizedBox.sizedBox_10,
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      "50",
                                      style: MangeStyles().getSemiBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.grey2,
              fontSize: FontSize.s16,
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                "المزيد",
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.grey2,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
