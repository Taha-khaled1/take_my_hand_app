import 'package:take_hand/presentation_layer/screen/courses_screen/widget/row_course.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/book_row.dart';
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
                  // const BooksTile(),

                  TitleWidget(
                    title: "دورات خاصه بالمجال",
                    // onTap: () {},
                  ),
                  RowCourse(deviceInfo: deviceInfo),
                  TitleWidget(
                    title: "كتب خاصه بالمجال",
                    // onTap: () {},
                  ),
                  BookRow(deviceInfo: deviceInfo),
                  SizedBox(
                    height: 10,
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

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.grey2,
              fontSize: FontSize.s16,
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                "المزيد",
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.grey2,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
