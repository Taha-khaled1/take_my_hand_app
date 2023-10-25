import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:get/get.dart';
import 'package:take_hand/main.dart';

class CustomSwitchLanguge extends StatefulWidget {
  const CustomSwitchLanguge({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomSwitchLangugeState createState() => _CustomSwitchLangugeState();
}

class _CustomSwitchLangugeState extends State<CustomSwitchLanguge> {
  bool _value = sharedPreferences.getString('lang') == 'ar' ? false : true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      activeColor: ColorManager.kPrimary,
      value: _value,
      onChanged: (value) {
        if (sharedPreferences.getString('lang') == 'ar') {
          sharedPreferences.setString("lang", 'en');
          Get.updateLocale(const Locale('en'));
        } else {
          sharedPreferences.setString("lang", 'ar');
          Get.updateLocale(const Locale('ar'));
        }
        setState(() {
          _value = !_value;
        });
      },
      title: Row(
        children: [
          Image.asset(
            sharedPreferences.getString('lang') == 'ar'
                ? 'assets/icons/egypt.png'
                : 'assets/icons/uslogo.png',
            width: 27,
            height: 27,
          ),
          const SizedBox(width: 30),
          Text(
            AppStrings.chang_lang.tr,
            style: MangeStyles().getBoldStyle(
              color: Colors.white,
              fontSize: FontSize.s18,
            ),
          ),
        ],
      ),
    );
  }
}
