import 'package:take_hand/application_layer/service/localizetion/changelangue.dart';
import 'package:take_hand/application_layer/service/localizetion/translate.dart';
import 'package:take_hand/presentation_layer/resources/routes_pages.dart';
import 'package:take_hand/presentation_layer/resources/theme_manager.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      theme: getApplicationTheme(),
      getPages: getPage,
    );
  }
}
