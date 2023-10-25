import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(AppStrings.about_us.tr),
      backgroundColor: ColorManager.background,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
