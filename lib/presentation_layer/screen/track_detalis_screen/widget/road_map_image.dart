import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/track_detalis_controller.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class RoadMapImage extends StatelessWidget {
  const RoadMapImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.testImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: 260,
          height: 57,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.29),
              borderRadius: BorderRadius.circular(15)),
          child: GetBuilder<TrackDetalisController>(
            init: TrackDetalisController(),
            initState: (_) {},
            builder: (_) {
              return OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: _.intialButtonColor,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  "اضغط لمشاهدة خريطة التعلم",
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.grey2,
                    fontSize: FontSize.s16,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
