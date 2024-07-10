import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:take_hand/presentation_layer/screen/chatbot_screen/chatbot_controller.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final String time;

  ChatMessage({
    Key? key,
    required this.message,
    required this.isSentByMe,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatbotController>();
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: isSentByMe ? 0 : 30, end: isSentByMe ? 30 : 0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: isSentByMe
                    ? LinearGradient(
                        colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: [
                          ColorManager.backgroundpersonalimage,
                          ColorManager.background
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: isSentByMe ? Radius.circular(16) : Radius.zero,
                  bottomRight: isSentByMe ? Radius.zero : Radius.circular(16),
                ),
              ),
              child: isSentByMe
                  ? Text(
                      message,
                      style: MangeStyles().getRegularStyle(
                        color: Colors.white,
                        fontSize: FontSize.s16,
                      ),
                    )
                  : Column(
                      children: [
                        MarkdownTypewriter(
                          duration: Duration(seconds: 35),
                          durationFuture: Duration(milliseconds: 500),
                          markdown: message,
                          style: MangeStyles().getRegularStyle(
                            color: Colors.white,
                            fontSize: FontSize.s16,
                          ),
                          onTick: () {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              HelperFunction.printRedText("onTick Run");
                              controller.pageController.animateTo(
                                controller
                                    .pageController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeOut,
                              );
                            });
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: message));
                              HelperFunction.showToast(
                                "تم نسخ الرساله الي الحافظه",
                              );
                            },
                            child: Icon(Icons.copy),
                          ),
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: isSentByMe
                  ? EdgeInsets.only(right: 12, top: 4)
                  : EdgeInsets.only(left: 12, top: 4),
              child: Text(
                time,
                style: MangeStyles().getRegularStyle(
                  color: Colors.white70,
                  fontSize: FontSize.s12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarkdownTypewriter extends StatefulWidget {
  final String markdown;
  final TextStyle style;
  final Duration duration, durationFuture;
  final VoidCallback onTick; // Add this callback

  MarkdownTypewriter({
    Key? key,
    required this.onTick, // Require it in constructor

    required this.markdown,
    required this.style,
    this.duration = const Duration(seconds: 35),
    required this.durationFuture,
  }) : super(key: key);

  @override
  _MarkdownTypewriterState createState() => _MarkdownTypewriterState();
}

class _MarkdownTypewriterState extends State<MarkdownTypewriter>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  late DurationResponse valueR;
  @override
  void initState() {
    super.initState();
    valueR = duration(widget.markdown.length);
    HelperFunction.printWhiteText(widget.markdown.length.toString());
    _controller = AnimationController(
      duration: Duration(seconds: valueR.durationText),
      vsync: this,
    );

    _animation = IntTween(begin: 0, end: widget.markdown.length).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        Future.delayed(Duration(milliseconds: valueR.durationFuture), () {})
            .then((value) {
          HelperFunction.printYellowText("onTick");
          widget.onTick();
        });
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
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        String partialMarkdown = widget.markdown.substring(0, _animation.value);
        return MarkdownBody(
          data: partialMarkdown,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            p: widget.style,
          ),
        );
      },
    );
  }

  // This is needed for AutomaticKeepAliveClientMixin
  @override
  bool get wantKeepAlive => true;
}

class DurationResponse {
  final int durationFuture;
  final int durationText;

  DurationResponse({required this.durationFuture, required this.durationText});
}

DurationResponse duration(int messageLength) {
  if (messageLength < 100) {
    return DurationResponse(
      durationFuture: 800,
      durationText: 2,
    );
  } else if (messageLength < 200) {
    return DurationResponse(
      durationFuture: 330,
      durationText: 5,
    );
  } else if (messageLength < 600) {
    return DurationResponse(
      durationFuture: 300,
      durationText: 20,
    );
  } else if (messageLength < 1000) {
    return DurationResponse(
      durationFuture: 280,
      durationText: 35,
    );
  } else if (messageLength < 1400) {
    return DurationResponse(
      durationFuture: 230,
      durationText: 45,
    );
  } else {
    // For very long messages, increase both values to handle the longer text
    return DurationResponse(
      durationFuture: 200,
      durationText: 55,
    );
  }
}
