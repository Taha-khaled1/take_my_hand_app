import 'package:line_icons/line_icons.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';

class BookCardTile extends StatelessWidget {
  const BookCardTile({
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
// version 2 -----------------------------------------------------------------

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.image,
    required this.name,
  });
  final String image, name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          // fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              height: 150,
              child: Image.asset(
                image,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Text(
          name,
          style: MangeStyles().getRegularStyle(
            color: ColorManager.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
