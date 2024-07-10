import 'package:take_hand/main.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class LocaleController extends GetxController {
  Locale? language;
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      print("ar");
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
