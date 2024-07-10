import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/components/custom_back_button.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/tab_app_controller.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

PreferredSizeWidget appbar(String title, {Color? color}) {
  TabAppController tabAppController = Get.put(TabAppController());
  return AppBar(
    elevation: 0,
    backgroundColor: color ?? ColorManager.background,
    title: Text(
      title,
      style: MangeStyles.textButtonStyle,
    ),
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: CustomBackButton(
        borderRadius: 10,
        onTap: tabAppController.toggleDrawer,
        height: 45,
        width: 45,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(
            "assets/icons/menu.png",
            color: ColorManager.white,
          ),
        ),
      ),
    ),
    actions: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomBackButton(),
      ),
    ],
  );
}
