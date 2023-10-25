import 'package:line_icons/line_icons.dart';
import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/body_app.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class TrackDetalisScreen extends StatelessWidget {
  const TrackDetalisScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BodyAppScreen(
      title: "xczc",
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Column(
            children: [
              Text(
                "اضغط لمشاهدة خريطة التعليم",
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.grey2,
                  fontSize: FontSize.s16,
                ),
              ),
              const Icon(Icons.access_alarm),
              const TeachersTile(),
              const YoutubeTile(),
              const BooksTile(),
            ],
          );
        },
      ),
    );
  }
}

class BooksTile extends StatelessWidget {
  const BooksTile({
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
        "اضغط لمشاهدة افضل الكتب",
        style: MangeStyles().getBoldStyle(
          color: ColorManager.grey2,
          fontSize: FontSize.s16,
        ),
      ),
      children: const [
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
      ],
    );
  }
}

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

class TeachersTile extends StatelessWidget {
  const TeachersTile({
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
        "اضغط لمشاهدة افضل المدربين",
        style: MangeStyles().getBoldStyle(
          color: ColorManager.grey2,
          fontSize: FontSize.s16,
        ),
      ),
      children: const [
        TeacherCard(),
        TeacherCard(),
        TeacherCard(),
        TeacherCard(),
      ],
    );
  }
}

class TeacherCard extends StatelessWidget {
  const TeacherCard({
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

class BookCard extends StatelessWidget {
  const BookCard({
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
