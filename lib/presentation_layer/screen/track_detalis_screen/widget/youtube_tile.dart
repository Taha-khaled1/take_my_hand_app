import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/youtube_card.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class YoutubeTile extends StatelessWidget {
  const YoutubeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Icon(
        Icons.keyboard_arrow_down_sharp,
        color: ColorManager.white,
      ),
      iconColor: Colors.amber,
      title: Text(
        "اضغط لمشاهدة قنوات اليوتيوب",
        style: MangeStyles().getBoldStyle(
          color: ColorManager.grey2,
          fontSize: FontSize.s16,
        ),
      ),
      children: const [
        YoutubeCard(),
        YoutubeCard(),
        YoutubeCard(),
        YoutubeCard(),
      ],
    );
  }
}
