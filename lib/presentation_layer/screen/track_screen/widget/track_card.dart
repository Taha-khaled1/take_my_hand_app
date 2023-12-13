import 'package:take_hand/domain_layer/models/course_model.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/track_detalis_screen.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class TrackCard extends StatelessWidget {
  const TrackCard({
    super.key,
    required this.trackModel,
  });
  final TrackModel trackModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const TrackDetalisScreen());
      },
      child: ClayContainer(
        color: ColorManager.background,
        height: 150,
        width: 200,
        spread: 2,
        borderRadius: 15,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorManager.background,
            image: DecorationImage(
              image: AssetImage(trackModel.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  trackModel.name,
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.white,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '(7) دورات تعليميه',
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.white,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
