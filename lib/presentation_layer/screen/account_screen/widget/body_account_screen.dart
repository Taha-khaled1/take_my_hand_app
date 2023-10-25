import 'package:take_hand/presentation_layer/screen/account_screen/widget/custom_title.dart';
import 'package:take_hand/presentation_layer/screen/support_screen/support_screen.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';

class BodyAccountScreen extends StatelessWidget {
  const BodyAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              CustomTitle(text: AppStrings.account.tr),

              CustomListtile(
                widget: const Icon(Icons.privacy_tip_outlined,
                    color: ColorManager.white),
                titel: AppStrings.privacy_policy.tr,
                onTap: () {
                  Get.to(() => const PrivacyPolicyScreen());
                },
              ),

              CustomListtile(
                widget: const Icon(Icons.policy_outlined,
                    color: ColorManager.white),
                titel: AppStrings.terms_and_conditions.tr,
                onTap: () {
                  Get.to(() => const TermsAndConditionsScreen());
                },
              ),
              CustomListtile(
                widget: const Icon(Icons.share, color: ColorManager.white),
                titel: AppStrings.share_app.tr,
                onTap: () {
                  Get.to(() => const ShareAppScreen());
                },
              ),
              const CustomTitle(text: "المساعده"),
              const SizedBox(
                height: 15,
              ),
              CustomListtile(
                widget: Image.asset(
                  "assets/icons/info.png",
                  color: ColorManager.white,
                  width: 30,
                ),
                titel: "معلومات عنا",
                onTap: () {
                  Get.to(() => const AboutPage());
                },
              ),
              CustomListtile(
                widget: Image.asset(
                  "assets/icons/customer-service.png",
                  color: ColorManager.white,
                  width: 30,
                ),
                titel: "الدعم الفني",
                onTap: () {
                  Get.to(() => const SupportScreen());
                },
              ),
              // const CustomSwitchLanguge(),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: deviceInfo.localWidth * 0.1),
                child: CustomButton(
                  width: deviceInfo.localWidth * 0.8,
                  height: 60,
                  backgroundColor: ColorManager.kPrimary,
                  text: sharedPreferences.getString("token") == null
                      ? "تسجيل الدخول"
                      : "تسجيل الخروح",
                  press: () async {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
