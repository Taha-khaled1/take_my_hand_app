import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/course_platforms_controller.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/widget/plat_form_card.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:take_hand/presentation_layer/utils/view_handlers/view_handlers.dart';

class CoursePlatformsScreen extends GetView<CoursePlatformsController> {
  const CoursePlatformsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: GetBuilder<CoursePlatformsController>(
          init: CoursePlatformsController(),
          builder: (_) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: ListView.builder(
                itemCount:
                    controller.providerModel?.data?.providersPlatform?.length,
                itemBuilder: (BuildContext context, int index) {
                  return PlatformCard(
                    platformName: controller.providerModel?.data
                            ?.providersPlatform?[index].titleAr ??
                        "",
                    description: controller.providerModel?.data
                            ?.providersPlatform?[index].shortDescriptionAr ??
                        "",
                    imageUrl: HelperFunction.imageNetworkCheck(
                        controller.providerModel?.data
                            ?.providersPlatform?[index].image,
                        isUrl: true),
                    onPressed: () {
                      if (controller.providerModel?.data
                              ?.providersPlatform?[index].createdBy ==
                          "real") {
                        Get.toNamed(Routes.udemyFreeCourse);
                      } else if (controller.providerModel?.data
                              ?.providersPlatform?[index].createdBy ==
                          "classcentral") {
                        Get.toNamed(
                          Routes.classcentral,
                          arguments: {
                            "provider": controller.providerModel?.data
                                ?.providersPlatform?[index].name!
                                .toLowerCase()
                          },
                        );
                      }
                    },
                  );
                },
              ),
            );
          }),
    );
  }
}
