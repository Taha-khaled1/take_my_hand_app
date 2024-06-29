import 'dart:math';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:lottie/lottie.dart';
import 'package:take_hand/data_layer/models/message.dart';
import 'package:take_hand/presentation_layer/screen/chatbot_screen/chatbot_controller.dart';
import 'package:take_hand/presentation_layer/screen/chatbot_screen/widget/chat_message.dart';
import 'package:take_hand/presentation_layer/screen/chatbot_screen/widget/header_chatbot.dart';
import 'package:take_hand/presentation_layer/screen/chatbot_screen/widget/message_input_field.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class ChatbotScreen extends GetView<ChatbotController> {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Column(
            children: [
              HeaderChatBot(),
              GetBuilder<ChatbotController>(
                init: ChatbotController(),
                initState: (_) {},
                builder: (_) {
                  return Expanded(
                    child: ListView.builder(
                      // reverse: true, // Reverse the list
                      controller: controller.pageController,
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        return ChatMessage(
                          key: ValueKey(controller.messages[index].id),
                          message: controller.messages[index].message ?? "",
                          isSentByMe: controller.messages[index].isSentByMe,
                          time: controller.messages[index].time,
                        );
                      },
                    ),
                  );
                },
              ),
              GetBuilder<ChatbotController>(
                init: ChatbotController(),
                initState: (_) {},
                builder: (_) {
                  return controller.isLoading
                      ? Lottie.asset("assets/json/ai.json")
                      : SizedBox();
                },
              ),
              MessageInputField(
                onTapTypeWriter: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    controller.pageController.animateTo(
                      controller.pageController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  });
                },
                onTap: () async {
                  controller.messages.add(
                    // 0,
                    Message(
                      id: Random().nextInt(100000),
                      message: controller.textEditingController.text,
                      isSentByMe: true,
                      time: "10:45 AM",
                    ),
                  );
                  controller.isLoading = true;
                  controller.update(); // Notifies listeners to rebuild the UI

                  // Wait for the next frame to complete so the list updates visually
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    controller.pageController.animateTo(
                      controller.pageController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  });
                  String messge = controller.textEditingController.text;
                  controller.textEditingController.clear();

                  final gemini = Gemini.instance;
                  final response = await gemini.text(messge);
                  print(response?.output);

                  controller.messages.add(
                    // 0,
                    Message(
                      id: Random().nextInt(100000),
                      message: response?.output,
                      isSentByMe: false,
                      time: "10:55 AM",
                    ),
                  );
                  controller.isLoading = false;
                  controller.update(); // Update again with the response

                  // Again wait for the UI to update before scrolling
                  // WidgetsBinding.instance.addPostFrameCallback(
                  //   (_) {
                  //     controller.pageController.animateTo(
                  //       controller.pageController.position.maxScrollExtent,
                  //       duration: Duration(seconds: 1),
                  //       curve: Curves.easeOut,
                  //     );
                  //   },
                  // );
                },
                controller: controller.textEditingController,
              ),
            ],
          );
        },
      ),
    );
  }
}

// await controller.pageController.animateTo(
//                       controller.pageController.position.maxScrollExtent,
//                       duration: Duration(milliseconds: 300),
//                       curve: Curves.easeOut,
//                     );
//  await _scrollController.animateTo(
//       0,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );

// 1711
