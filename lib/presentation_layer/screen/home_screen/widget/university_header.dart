import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class UniversityHeader extends StatelessWidget {
  const UniversityHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190,
          width: 270,
          decoration: BoxDecoration(
            color: ColorManager.backgroundpersonalimage,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                "https://img.freepik.com/free-photo/autumn-leaf-falling-revealing-intricate-leaf-vein-generated-by-ai_188544-9869.jpg?w=1380&t=st=1719253513~exp=1719254113~hmac=7a72da12a07c52f7621c128609c365d0acdadfaaee2e81bdc492793f74a2f02a",
              ),
              fit: BoxFit.cover,
            ),
          ),

          // child:
          //  CachedNetworkImage(
          //   imageUrl:
          //     ,
          //   height: 200,
          //   placeholder: (context, url) => Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
        ),
        PositionedDirectional(
          start: 5,
          bottom: 3,
          child: CustomCircleImage(
            radius: 45,
            image:
                "https://wallpapers.com/images/featured/hd-a5u9zq0a0ymy2dug.jpg",
          ),
        ),
      ],
    );
  }
}
