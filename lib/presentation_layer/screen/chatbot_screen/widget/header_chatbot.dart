import 'package:take_hand/presentation_layer/components/custom_back_button.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class HeaderChatBot extends StatelessWidget {
  const HeaderChatBot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: CustomBackButton(),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: CustomCircleImage(
                radius: 24,
                image:
                    'https://static.vecteezy.com/system/resources/thumbnails/007/225/199/small_2x/robot-chat-bot-concept-illustration-vector.jpg',
              ),
            ),
            SizedBox(width: 10),
            Text(
              'بوت المحادثة',
              style: MangeStyles().getBoldStyle(
                color: ColorManager.white,
                fontSize: FontSize.s14,
              ),
            ),
            Expanded(child: SizedBox()),
            Icon(
              Icons.more_vert,
            )
          ],
        ),
      ),
    );
  }
}
