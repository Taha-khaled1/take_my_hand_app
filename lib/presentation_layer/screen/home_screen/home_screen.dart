import 'package:take_hand/domain_layer/models/college_model.dart';
import 'package:take_hand/domain_layer/models/course_model.dart';
import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/college_card.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/course_card.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_view.dart';

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
                const CarouselSliderBanner(),
                const SizedBox(
                  height: 15,
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
        'https://business.louisville.edu/bizprod/wp-content/uploads/2020/04/BigRed-altLogo-700x394.jpg',
    name: 'كلية تجاره',
  ),
  CollegeModel(
    imageUrl:
        'https://business.louisville.edu/bizprod/wp-content/uploads/2020/04/BigRed-altLogo-700x394.jpg',
    name: 'كلية تجاره',
  ),
  CollegeModel(
    imageUrl:
        'https://business.louisville.edu/bizprod/wp-content/uploads/2020/04/BigRed-altLogo-700x394.jpg',
    name: 'كلية تجاره',
  ),
  CollegeModel(
    imageUrl:
        'https://business.louisville.edu/bizprod/wp-content/uploads/2020/04/BigRed-altLogo-700x394.jpg',
    name: 'كلية تجاره',
  ),
];
