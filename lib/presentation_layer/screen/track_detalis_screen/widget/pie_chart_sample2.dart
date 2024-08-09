import 'package:fl_chart/fl_chart.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/indicator.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Indicator(
                color: Color(0xff4CAF50),
                text: 'المتعلمين المستمرين',
                isSquare: true,
              ),
              AppSizedBox.sizedBox_10,
              Indicator(
                color: ColorManager.kPrimary3,
                text: 'متعلمين اكملو المجال',
                isSquare: true,
              ),
              AppSizedBox.sizedBox_10,
              Indicator(
                color: Color(0xffFF5722),
                text: 'متعلمين تركوا المجال',
                isSquare: true,
              ),
              AppSizedBox.sizedBox_10,
            ],
          ),
        ),
        Expanded(
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: showingSections(),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xff4CAF50),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: ColorManager.kPrimary3,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xffFF5722),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
