import 'package:take_hand/presentation_layer/src/account_url.dart';

class RoadMapImage extends StatelessWidget {
  const RoadMapImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.testImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            bottom: 50,
            start: 15,
            child: SizedBox(
              width: 130,
              child: Text(
                "مجال البرمجه للكبار",
                style: MangeStyles().getSemiBoldStyle(
                  color: ColorManager.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 5,
            start: 5,
            child: Row(
              children: [
                CustomButton(
                  width: 120,
                  rectangel: 10,
                  height: 40,
                  backgroundColor: ColorManager.white,
                  text: "خريطة التعلم",
                  colorText: ColorManager.black,
                  press: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                CustomButton(
                  width: 120,
                  rectangel: 10,
                  height: 40,
                  backgroundColor: ColorManager.kPrimary2,
                  text: "احجز مرشد",
                  press: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
