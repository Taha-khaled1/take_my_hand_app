import 'package:take_hand/presentation_layer/screen/favorite_screen/favorite_screen.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/course_card.dart';
import 'package:take_hand/presentation_layer/src/components_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_view.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/enums/device_type.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/models/device_info.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbar("الدورات التعليميه"),
      body: Center(
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return deviceInfo.deviceType == DeviceType.Tablet
                ? RowCourse(deviceInfo: deviceInfo)
                : ColumnCourse(
                    deviceInfo: deviceInfo,
                  );
          },
        ),
      ),
    );
  }
}

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
          return const CourseCard();
        },
      ),
    );
  }
}
