import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(AppStrings.share_app.tr),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 45,
                ),
                Lottie.asset(
                  "assets/json/share.json",
                  height: 400,
                  width: deviceInfo.localWidth * 0.95,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 65,
                  width: Get.width * 0.6,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorManager.kPrimary),
                    ),
                    onPressed: () async {
                      try {
                        final box = context.findRenderObject() as RenderBox?;
                        await Share.share(
                          AppStrings.share_app.tr,
                          sharePositionOrigin:
                              box!.localToGlobal(Offset.zero) & box.size,
                        );
                      } catch (e) {
                        HelperFunction.showToast(
                          "يوجد مشكله في مشاركة التطبيق",
                        );
                      }
                    },
                    icon: const Icon(Icons.share),
                    label: Text(
                      AppStrings.share_app.tr,
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.white,
                        fontSize: 20,
                      ),
                    ),
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
