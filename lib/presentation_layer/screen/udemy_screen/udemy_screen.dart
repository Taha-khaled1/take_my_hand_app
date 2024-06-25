import 'package:take_hand/presentation_layer/screen/favorite_screen/favorite_screen.dart';
import 'package:take_hand/presentation_layer/screen/udemy_screen/udemy_controller.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:take_hand/presentation_layer/utils/view_handlers/view_handlers.dart';

class UdemyScreen extends GetView<UdemyFreeCourseController> {
  const UdemyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<UdemyFreeCourseController>(builder: (context) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount:
                    controller.udemyFreeCoursesCouponModel?.results?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: HelperView.childGridView(deviceInfo),
                  childAspectRatio: 0.63,
                ),
                itemBuilder: (context, index) {
                  return controller.udemyFreeCoursesCouponModel!.results![index]
                              .type !=
                          "Affiliate"
                      ? CourseCardSqure(
                          imageUrl: controller.udemyFreeCoursesCouponModel!
                                  .results![index].image ??
                              "", // Change this to your image path
                          title: controller.udemyFreeCoursesCouponModel!
                                  .results![index].name ??
                              "",
                          isFree: true, // Set this based on your data
                          evaluation: double.parse(controller
                                  .udemyFreeCoursesCouponModel!
                                  .results![index]
                                  .rating ??
                              "0.0"), // Set this based on your data
                          trackName: controller.udemyFreeCoursesCouponModel!
                                  .results![index].category ??
                              "", // Change this accordingly
                          price: controller.udemyFreeCoursesCouponModel!
                                  .results![index].price ??
                              "",
                          discountedPrice: controller
                                  .udemyFreeCoursesCouponModel!
                                  .results![index]
                                  .salePrice ??
                              "",
                        )
                      : SizedBox();
                },
              ),
            );
          });
        },
      ),
    );
  }
}
