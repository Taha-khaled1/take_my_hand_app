import 'package:take_hand/presentation_layer/screen/courses_screen/widget/row_course.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/books_tile.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/road_map_image.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/teachers_tile.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/youtube_tile.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class TrackDetalisScreen extends StatelessWidget {
  const TrackDetalisScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const RoadMapImage(),
                  const TeachersTile(),
                  const YoutubeTile(),
                  const BooksTile(),
                  SizedBox(
                    height: 556,
                    child: RowCourse(deviceInfo: deviceInfo),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
