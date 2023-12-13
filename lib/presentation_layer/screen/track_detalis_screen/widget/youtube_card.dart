import 'package:line_icons/line_icons.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class YoutubeCard extends StatelessWidget {
  const YoutubeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          minLeadingWidth: 55,
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: ColorManager.background,
            backgroundImage: AssetImage("assets/icons/person.jpg"),
          ),
          title: Text(
            "اسامه محمد الزيرو",
            style: MangeStyles().getBoldStyle(
              color: ColorManager.grey2,
              fontSize: FontSize.s16,
            ),
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  LineIcons.youtube,
                  color: ColorManager.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
