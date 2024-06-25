import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/course_platforms_controller.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/plat_form_card.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';

class CoursePlatformsScreen extends GetView<CoursePlatformsController> {
  const CoursePlatformsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return PlatformCard(
            platformName: 'Udemy',
            description:
                'Udemy offers a wide range of free courses on various topics.',
            imageUrl:
                'https://img.etimg.com/thumb/msid-71427663,width-300,height-225,imgsize-57628,resizemode-75/coursera-agencies.jpg',
            onPressed: () {
              Get.toNamed(Routes.udemyFreeCourse);
            },
          );
        },
      ),
    );
  }
}
