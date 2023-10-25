import 'package:line_icons/line_icons.dart';
import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/bottom_section_course.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_view.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/models/device_info.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbar("المفضله"),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return RowCourse(
            deviceInfo: deviceInfo,
          );
        },
      ),
    );
  }
}

class RowCourse extends StatelessWidget {
  const RowCourse({
    super.key,
    required this.deviceInfo,
  });
  final DeviceInfo deviceInfo;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: HelperView.childGridView(deviceInfo),
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return const CourseWidget(
          imageUrl:
              "https://business.louisville.edu/bizprod/wp-content/uploads/2020/04/BigRed-altLogo-700x394.jpg", // Change this to your image path
          title: "Course Title", // Change this accordingly
          isFree: true, // Set this based on your data
          evaluation: 4.5, // Set this based on your data
          collegeName: "Sample College", // Change this accordingly
        );
      },
    );
  }
}

class CourseWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isFree;
  final double evaluation;
  final String collegeName;

  const CourseWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isFree,
    required this.evaluation,
    required this.collegeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ClayContainer(
        color: ColorManager.background,
        // height: 150,
        // width: 200,
        borderRadius: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClayContainer(
                          color: ColorManager.background,
                          height: 48,
                          width: 48,
                          borderRadius: 50,
                          spread: 2,
                          curveType: CurveType.concave,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                LineIcons.heart,
                                size: 30,
                                color: ColorManager.kPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "تعلم البايثون مع كورس تعلم تصميم المواقع",
                style: MangeStyles().getRegularStyle(
                  color: ColorManager.white,
                  fontSize: 14,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomTag(title: "كورس  مجاني"),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: BottomSectionCourse(
                  college: " كلية تجاره",
                  star: "5.0",
                )),
          ],
        ),
      ),
    );
  }
}
