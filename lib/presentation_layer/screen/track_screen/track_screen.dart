import 'package:flutter/material.dart';
import 'package:take_hand/domain_layer/models/course_model.dart';
import 'package:take_hand/presentation_layer/resources/color_manager.dart';
import 'package:take_hand/presentation_layer/screen/track_screen/widget/track_card.dart';
import 'package:take_hand/presentation_layer/src/components_packge.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbar("مجالات تجاره"),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.custom(
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                pattern: [
                  const WovenGridTile(1),
                  const WovenGridTile(
                    5 / 7,
                    crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: tracks.length,
                (context, index) => TrackCard(trackModel: tracks[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<TrackModel> tracks = [
  TrackModel(
    imageUrl: 'assets/images/cyber.jpg',
    name: 'الامن السيبراني',
  ),
  TrackModel(
    imageUrl: 'assets/images/ai.jpg',
    name: 'ذكاء اصطناعي',
  ),
  TrackModel(
    imageUrl: 'assets/images/arg.jpg',
    name: 'الهندسة الزراعية',
  ),
  TrackModel(
    imageUrl: 'assets/images/mobile.jpg',
    name: 'تطبيقات الهاتف',
  ),
  TrackModel(
    imageUrl: 'assets/images/web.jpg',
    name: 'تطبيقات الويب',
  ),
  TrackModel(
    imageUrl: 'assets/images/acontant.jpg',
    name: 'المحاسبه',
  ),
  TrackModel(
    imageUrl: 'assets/images/mangment.jpg',
    name: 'ادارة اعمال',
  ),
];
