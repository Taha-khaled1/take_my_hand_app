import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:take_hand/presentation_layer/screen/favorite_screen/favorite_screen.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/book_card.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/difficulty_level_painter.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/field_widget.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/pie_chart_sample2.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/road_map_image.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/title_widget.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class TrackDetalisScreen extends StatelessWidget {
  const TrackDetalisScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(ImageAssets.testImage),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const RoadMapImage(),
                  TitleWidget(
                    title: "المدرسين",
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: UserInfoWidget(
                            userName: 'John Doe',
                            userSpecialty: 'Software Developer',
                            userEvaluation: '4.5/5',
                            userImage: 'https://example.com/user.jpg',
                          ),
                        );
                      },
                    ),
                  ),
                  TitleWidget(
                    title: "دورات خاصه بالمجال",
                  ),
                  SizedBox(
                    height: 280,
                    // width: ,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 200,
                          child: CourseCardSqure(
                            imageUrl:
                                "https://mrwallpaper.com/images/hd/cool-profile-pictures-panda-man-gsl2ntkjj3hrk84s.jpg",
                            title: "udemy Free",
                            isFree: true,
                            evaluation: 4.0,
                            trackName: "program",
                            price: "400",
                            discountedPrice: "0.0",
                          ),
                        );
                      },
                    ),
                  ),
                  TitleWidget(
                    title: "كتب خاصه بالمجال",
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return BookCard(
                          image: "assets/images/downlo0ad.png",
                          name: "كود نظيف",
                        );
                      },
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     ClayContainer(
                  //       color: ColorManager.backgroundpersonalimage,
                  //       width: 200,
                  //       height: 200,
                  //       borderRadius: 15,
                  //       spread: 1.5,
                  //       depth: 15,
                  //       curveType: CurveType.concave,
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 10,
                  //           vertical: 3,
                  //         ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.end,
                  //           children: [
                  //             Text(
                  //               "View the path in app",
                  //               style: MangeStyles().getSemiBoldStyle(
                  //                 color: ColorManager.grey2,
                  //                 fontSize: 14,
                  //               ),
                  //             ),
                  //             AppSizedBox.sizedBox_10,
                  //             Row(
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                     horizontal: 5,
                  //                     vertical: 3,
                  //                   ),
                  //                   child: Text(
                  //                     "50",
                  //                     style: MangeStyles().getSemiBoldStyle(
                  //                       color: ColorManager.white,
                  //                       fontSize: 30,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  TitleWidget(
                    title: "مقاييس مشاركة المتعلمين",
                  ),
                  Container(
                    height: 200,
                    width: deviceInfo.localWidth * 0.96,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: ColorManager.backgroundpersonalimage,
                      ),
                    ),
                    child: PieChartSample2(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TitleWidget(
                    title: "مقاييس مشاركة المتعلمين",
                  ),
                  Container(
                    height: 200,
                    width: deviceInfo.localWidth * 0.97,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: ColorManager.backgroundpersonalimage,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: deviceInfo.localWidth * 0.45,
                          child: FieldWidget(
                            icon: Icons.visibility,
                            title: 'مشاهدة المجال في التطبيق',
                            value: '12,345', // Replace with actual data
                            color: Color(0xff259f94),
                          ),
                        ),
                        SizedBox(
                          width: deviceInfo.localWidth * 0.45,
                          child: FieldWidget(
                            icon: Icons.visibility, color: Color(0xffdc3733),
                            title: 'اجمالي عدد متعلمين المجال',
                            value: '12,345', // Replace with actual data
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TitleWidget(
                    title: "مستوي صعوبة تعلم المجال",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DifficultyLevelRadialChart(
                        difficultyLevel:
                            60.0, // Replace with actual value from your database
                      ),
                      Column(
                        children: [
                          Text(
                            '5 اشهر',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'متوسط اكمال المجال',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  TitleWidget(
                    title: "مستوي نمو المجال",
                  ),
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: GrowthRateChart(),
                  ),
                  // AverageCompletionTimeBar(averageCompletionTime: 5),
                  // SizedBox(
                  // height: 20,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AverageCompletionTimeBar extends StatefulWidget {
  final double averageCompletionTime;

  const AverageCompletionTimeBar(
      {Key? key, required this.averageCompletionTime})
      : super(key: key);

  @override
  _AverageCompletionTimeBarState createState() =>
      _AverageCompletionTimeBarState();
}

class _AverageCompletionTimeBarState extends State<AverageCompletionTimeBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0, end: widget.averageCompletionTime).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[800],
          ),
          child: Stack(
            children: [
              // Background gradient bar
              Container(
                height: 30,
                width: 300 * (_animation.value / 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple, Colors.red],
                    stops: [0.3, 0.7, 1.0],
                  ),
                ),
              ),
              // Foreground particle effect or glow (optional)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 300 * (_animation.value / 12),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          '${_animation.value.toStringAsFixed(2)} months',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Avg Completion Time',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class GrowthRateChart extends StatelessWidget {
  final List<Map<String, dynamic>> growthData = [
    {'year': 2020, 'growth_rate': 6.0},
    {'year': 2021, 'growth_rate': 8.0},
    {'year': 2022, 'growth_rate': 9.0},
    {'year': 2023, 'growth_rate': 7.0},
    {'year': 2024, 'growth_rate': 5.0},
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true, drawVerticalLine: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Text('2020', style: TextStyle(color: Colors.white));
                  case 1:
                    return Text('2021', style: TextStyle(color: Colors.white));
                  case 2:
                    return Text('2022', style: TextStyle(color: Colors.white));
                  case 3:
                    return Text('2023', style: TextStyle(color: Colors.white));
                  case 4:
                    return Text('2024', style: TextStyle(color: Colors.white));
                }
                return Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            // axisNameSize: 50,
            axisNameWidget: SizedBox(
              width: 3,
            ),
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()}%',
                    style: TextStyle(color: Colors.white));
              },
            ),
          ),
          rightTitles: AxisTitles(
              axisNameWidget: SizedBox(width: 0),
              sideTitles: SideTitles(
                showTitles: false,
              )),
          topTitles: AxisTitles(
              axisNameWidget: SizedBox(width: 0),
              sideTitles: SideTitles(
                showTitles: false,
              )),
        ),
        borderData: FlBorderData(show: true),
        minX: 0,
        maxX: 4,
        minY: 0,
        maxY: 10,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, growthData[0]['growth_rate']),
              FlSpot(1, growthData[1]['growth_rate']),
              FlSpot(2, growthData[2]['growth_rate']),
              FlSpot(3, growthData[3]['growth_rate']),
              FlSpot(4, growthData[4]['growth_rate']),
            ],
            isCurved: true,
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent]),
            barWidth: 5,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(colors: [
                Colors.blueAccent.withOpacity(0.3),
                Colors.purpleAccent.withOpacity(0.3)
              ]),
            ),
            dotData: FlDotData(
              show: true,
            ), //dotSize: 6, dotColor: Colors.white
          ),
        ],
      ),
    );
  }
}
