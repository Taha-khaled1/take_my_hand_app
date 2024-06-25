import 'package:take_hand/presentation_layer/src/components_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class SectionHeaderAndFilter extends StatelessWidget {
  const SectionHeaderAndFilter({
    super.key,
    this.press,
    required this.title,
    required this.is_more,
  });
  final void Function()? press;
  final String title;
  final bool is_more;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: MangeStyles().getRegularStyle(
                color: ColorManager.white,
                fontSize: FontSize.s16,
              ),
            ),
            if (is_more)
              CustomButton(
                height: 40,
                width: 100,
                rectangel: 8,
                depth: 0,
                spread: 0,
                backgroundColor: ColorManager.backgroundpersonalimage,
                text: "الجميع",
                press: press,
                fontSize: FontSize.s14,
              ),
          ],
        ),
      ),
    );
  }
}
