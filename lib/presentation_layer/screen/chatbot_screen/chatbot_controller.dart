import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_hand/data_layer/models/message.dart';

class ChatbotController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  List<Message> messages = [];
  TextEditingController textEditingController = TextEditingController();
  bool isTyping = false;
  bool isLoading = false;
}
