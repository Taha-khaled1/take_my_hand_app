import 'package:take_hand/presentation_layer/screen/home_screen/widget/course_card.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_view.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/models/device_info.dart';

class ColumnCourse extends StatelessWidget {
  const ColumnCourse({
    super.key,
    required this.deviceInfo,
  });
  final DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HelperView.widthForTextField(deviceInfo),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return const CourseCardRectangular();
        },
      ),
    );
  }
}
