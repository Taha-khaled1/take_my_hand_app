import 'package:take_hand/presentation_layer/screen/courses_screen/widget/column_course.dart';
import 'package:take_hand/presentation_layer/screen/courses_screen/widget/row_course.dart';
import 'package:take_hand/presentation_layer/src/components_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/enums/device_type.dart';

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
                : ColumnCourse(deviceInfo: deviceInfo);
          },
        ),
      ),
    );
  }
}
