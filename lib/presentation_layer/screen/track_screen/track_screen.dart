import 'package:flutter/material.dart';
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
                (context, index) => const TrackCard(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Domain {
  final String name;
  final String imagePath; // path to the image asset or URL
  final String description;
  Domain(
      {required this.name, required this.imagePath, required this.description});
}

List<Domain> domains = [
  Domain(
    name: 'تطوير تطبيقات الموبايل',
    imagePath:
        'https://business.louisville.edu/bizprod/wp-content/uploads/2020/04/BigRed-altLogo-700x394.jpg',
    description: 'Development of mobile and desktop applications.',
  ),
  Domain(
    name: 'تطوير مواقع الانترنت',
    imagePath:
        'https://business.louisville.edu/bizprod/wp-content/uploads/2020/04/BigRed-altLogo-700x394.jpg',
    description: 'Development and design of responsive websites.',
  ),
  // ... add more domains as needed
];

class DomainCard extends StatelessWidget {
  final Domain domain;
  const DomainCard({super.key, required this.domain});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
