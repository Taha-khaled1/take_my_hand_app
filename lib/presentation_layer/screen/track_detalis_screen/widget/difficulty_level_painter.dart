import 'dart:math';

import 'package:take_hand/presentation_layer/src/style_packge.dart';

class DifficultyLevelPainter extends CustomPainter {
  final double difficultyLevel;

  DifficultyLevelPainter(this.difficultyLevel);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Paint backgroundPaint = Paint()
      ..color = ColorManager.backgroundpersonalimage
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    // Create gradient paints for each difficulty level
    final Paint easyPaint = Paint()
      ..shader = SweepGradient(
        startAngle: -pi / 2,
        endAngle: pi / 2,
        colors: [Color(0xff3fccec), Color(0xff3fccec)],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 8);

    final Paint mediumPaint = Paint()
      ..shader = SweepGradient(
        startAngle: pi / 2,
        endAngle: pi * 3 / 2,
        colors: [Colors.orangeAccent, Colors.orange],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 8);

    final Paint difficultPaint = Paint()
      ..shader = SweepGradient(
        startAngle: pi * 3 / 2,
        endAngle: pi * 5 / 2,
        colors: [Colors.red, Colors.pinkAccent],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 8);

    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * (difficultyLevel / 100);
    canvas.drawArc(rect, startAngle, 2 * pi, false, backgroundPaint);
    if (difficultyLevel <= 33) {
      // Only fill the easy section
      canvas.drawArc(
          rect, startAngle, 2 * pi * (difficultyLevel / 100), false, easyPaint);
    } else if (difficultyLevel <= 66) {
      // Fill the easy section completely and the medium section partially
      canvas.drawArc(rect, startAngle, 2 * pi * (33 / 100), false, easyPaint);
      canvas.drawArc(rect, startAngle + 2 * pi * (33 / 100),
          2 * pi * ((difficultyLevel - 33) / 100), false, mediumPaint);
    } else {
      // Fill the easy and medium sections completely, and the difficult section partially
      canvas.drawArc(rect, startAngle, 2 * pi * (33 / 100), false, easyPaint);
      canvas.drawArc(rect, startAngle + 2 * pi * (33 / 100),
          2 * pi * (33 / 100), false, mediumPaint);
      canvas.drawArc(rect, startAngle + 2 * pi * (66 / 100),
          2 * pi * ((difficultyLevel - 66) / 100), false, difficultPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Color getColor(double level) {
    if (level <= 33) {
      return Color(0xff3fccec);
    } else if (level <= 66) {
      return Colors.orange;
    } else {
      return Color(0xffea234b);
    }
  }
}

class DifficultyLevelRadialChart extends StatelessWidget {
  final double difficultyLevel;

  const DifficultyLevelRadialChart({Key? key, required this.difficultyLevel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          child: CustomPaint(
            painter: DifficultyLevelPainter(difficultyLevel),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${difficultyLevel.toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Difficulty Level',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
