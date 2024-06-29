import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:take_hand/data_layer/models/message.dart';
import 'package:take_hand/presentation_layer/screen/chatbot_screen/chatbot_screen.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class MessageInputField extends StatelessWidget {
  final void Function()? onTap, onTapTypeWriter;
  final TextEditingController controller;

  const MessageInputField({
    super.key,
    this.onTap,
    required this.controller,
    this.onTapTypeWriter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      color: ColorManager
          .background, // Ensure this is defined or use a specific color
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: ColorManager
                    .backgroundpersonalimage, // Ensure this is defined or use a specific color
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "اكتب رسالتك هنا",
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                onTap: onTapTypeWriter,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onTap,
            child: Container(
              child: Image.asset(
                "assets/icons/send-chat.png",
                width: 43,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

              // padding: EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //   color: ColorManager.kPrimary, // Vibrant send button
              //   shape: BoxShape.circle,
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withOpacity(0.5),
              //       spreadRadius: 0,
              //       blurRadius: 5,
              //       offset: Offset(0, 2),
              //     ),
              //   ],
              // ),