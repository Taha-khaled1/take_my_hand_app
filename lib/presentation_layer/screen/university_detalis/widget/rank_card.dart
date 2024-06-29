import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class RankCard extends StatelessWidget {
  const RankCard({
    super.key,
    required this.image,
    required this.rank,
    required this.country,
    required this.deviceInfo,
  });
  final String image, rank, country;
  final DeviceInfo deviceInfo;
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: ColorManager.background,
      depth: 10,
      spread: 1,
      width: deviceInfo.localWidth * 0.45,
      height: 100,
      borderRadius: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 50,
            height: 50,
          ),
          AppSizedBox.sizedBox_w5,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$rank#",
                style: MangeStyles().getRegularStyle(
                  color: ColorManager.kTextgray,
                  fontSize: FontSize.s20,
                ),
              ),
              Text(
                "في $country",
                style: MangeStyles().getRegularStyle(
                  color: ColorManager.kTextgray,
                  fontSize: FontSize.s17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
