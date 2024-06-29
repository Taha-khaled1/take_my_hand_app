import 'package:lottie/lottie.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CustomLottieAnimation extends StatefulWidget {
  @override
  _CustomLottieAnimationState createState() => _CustomLottieAnimationState();
}

class _CustomLottieAnimationState extends State<CustomLottieAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  // int _playCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _playCount++;
    //     if (_playCount < 2) {
    //       _controller.forward(from: 0.0);
    //     }
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) {
        if (mounted) {
          if (info.visibleFraction > 0.5 && !_controller.isAnimating) {
            _controller.forward();
          } else if (info.visibleFraction <= 0.5 && _controller.isAnimating) {
            _controller.stop(canceled: true);
          }
        }
      },
      child: Lottie.asset(
        "assets/json/play-button.json",
        controller: _controller,
        height: 100,
        width: 100,
        repeat: true,
      ),
    );
  }
}
