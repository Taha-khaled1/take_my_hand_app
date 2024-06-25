import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/college_card.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CollegeScreen extends StatelessWidget {
  const CollegeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbar("الكليات"),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GridView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: HelperView.childGridView(deviceInfo),
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CollegeCard(
                  imageUrl: colleges[0].imageUrl,
                  collegeName: colleges[0].name,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
