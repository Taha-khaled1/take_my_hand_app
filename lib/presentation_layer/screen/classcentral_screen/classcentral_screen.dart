import 'package:take_hand/presentation_layer/screen/classcentral_screen/classcentral_controller.dart';
import 'package:take_hand/presentation_layer/screen/favorite_screen/favorite_screen.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:take_hand/presentation_layer/utils/view_handlers/view_handlers.dart';

class ClassCentralScreen extends GetView<ClassCentralController> {
  const ClassCentralScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<ClassCentralController>(builder: (_) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: _.courseData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: HelperView.childGridView(deviceInfo),
                  childAspectRatio: 0.63,
                ),
                itemBuilder: (context, index) {
                  return CourseCardSqure(
                    imageUrl: _.courseData[index].picture,
                    title: _.courseData[index].name,
                    isFree: true,
                    evaluation:
                        double.tryParse(_.courseData[index].rating) ?? 0.0,
                    trackName: _.courseData[index].category == ""
                        ? "غير مصنف"
                        : _.courseData[index].category,
                    price: "0.0",
                    discountedPrice: "0.0",
                  );
                },
              ),
            );
          });
        },
      ),
    );
  }
}
