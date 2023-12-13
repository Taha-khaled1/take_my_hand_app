import 'package:cached_network_image/cached_network_image.dart';
import 'package:line_icons/line_icons.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/bottom_section_course.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';

class CourseCardRectangular extends StatelessWidget {
  const CourseCardRectangular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: ClayContainer(
            color: ColorManager.background,
            height: 150,
            // width: ,
            borderRadius: 15, spread: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://business.louisville.edu/bizprod/wp-content/uploads/2020/04/BigRed-altLogo-700x394.jpg",
                    width: deviceInfo.localWidth * 0.38,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "تعلم البايثون مع كورس تعلم تصميم المواقع",
                          style: MangeStyles().getRegularStyle(
                            color: ColorManager.white,
                            fontSize: 14,
                          ),
                        ),
                        const CustomTag(title: "كورس  مجاني"),
                        const BottomSectionCourse(
                          college: " كلية تجاره",
                          star: "5.0",
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
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
              ],
            ),
          ),
        );
      },
    );
  }
}
