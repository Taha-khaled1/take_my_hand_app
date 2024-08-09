import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/wave_shape.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class FieldWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;
  const FieldWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: ColorManager.backgroundpersonalimage,
      borderRadius: 8,
      spread: 1.5,
      depth: 8,
      height: 200,
      curveType: CurveType.none,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, 78),
            child: SizedBox(
              height: 100,
              child: WaveShape(
                color: color,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, right: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SEP 2024",
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s18,
                  ),
                ),
                AppSizedBox.sizedBox_20,
                Text(
                  title,
                  style: MangeStyles().getSemiBoldStyle(
                    color: Color(0xff259f94),
                    fontSize: FontSize.s14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.grey2,
                    fontSize: FontSize.s16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
