import 'package:take_hand/presentation_layer/screen/favorite_screen/favorite_screen.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class RowCourse extends StatelessWidget {
  const RowCourse({
    super.key,
    required this.deviceInfo,
  });
  final DeviceInfo deviceInfo;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: HelperView.childGridView(deviceInfo),
        childAspectRatio: 0.63,
      ),
      itemBuilder: (context, index) {
        return const CourseCardSqure(
          imageUrl: ImageAssets.testImage, // Change this to your image path
          title: "Course Title", // Change this accordingly
          isFree: true, // Set this based on your data
          evaluation: 4.5, // Set this based on your data
          trackName: "Sample College", // Change this accordingly
          price: '500', discountedPrice: '230',
        );
      },
    );
  }
}
