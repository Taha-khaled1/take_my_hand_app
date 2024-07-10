import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:take_hand/presentation_layer/resources/msnge_api.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunction {
  static List<String> StringTolist(String imagesJson) {
    // Parse the JSON string into a dynamic list
    List<dynamic> jsonList = jsonDecode(imagesJson);

    // Convert dynamic list to list of strings
    List<String> images = jsonList.map((url) => url.toString()).toList();

    // Print the list of images (for verification)
    // print(images);
    return images;
  }

  static String formatTimeCreateAt(String time, String language) {
    String originalDateString = '2024-07-05T02:03:26.000000Z';
    DateTime dateTime = DateTime.parse(originalDateString);

// Format for Arabic locale
    var formatterArabic = DateFormat('EEEE، dd MMMM yyyy'); // , 'ar'   hh:mm a
    String formattedDateArabic = formatterArabic.format(dateTime);

// Format for English locale
    var formatterEnglish = DateFormat('EEEE, MMMM dd, yyyy'); // , 'en'  hh:mm a
    String formattedDateEnglish = formatterEnglish.format(dateTime);
    return language == 'ar' ? formattedDateArabic : formattedDateEnglish;
  }

  static String formatTime(int timestampInMillis, String language) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampInMillis);
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String formattedMinute = minute.toString().padLeft(2, '0');

    // English formatting
    if (language == 'en') {
      if (hour >= 12) {
        return '${hour > 12 ? hour - 12 : hour}:$formattedMinute ${hour >= 12 ? 'pm' : 'am'}';
      } else {
        return '$hour:$formattedMinute ${hour >= 12 ? 'pm' : 'am'}';
      }
    }
    // Arabic formatting
    else if (language == 'ar') {
      if (hour >= 12) {
        return '${hour > 12 ? hour - 12 : hour}:$formattedMinute ${hour >= 12 ? 'م' : 'ص'}';
      } else {
        return '$hour:$formattedMinute ${hour >= 12 ? 'م' : 'ص'}';
      }
    }
    // Invalid language
    else {
      return 'Invalid language specified';
    }
  }

  static String subString(String text, int number) {
    String finalText = text;
    if (text.length > number) {
      finalText = '${text.substring(0, number - 1)}...';
    }
    return finalText;
  }

  static bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  static String imageNetworkCheck(String? image, {bool isUrl = false}) {
    if (image == null || image.isEmpty || image == ' ') {
      return 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
    }
    return isUrl ? image : APiMange.baseurlImage + "/" + image;
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorManager.kPrimary,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void printRedText(String text) {
    print('\x1B[31m$text\x1B[0m');
  }

  static void printGreenText(String text) {
    print('\x1B[32m$text\x1B[0m');
  }

  static void printYellowText(String text) {
    print('\x1B[33m$text\x1B[0m');
  }

  static void printBlueText(String text) {
    print('\x1B[34m$text\x1B[0m');
  }

  static void printMagentaText(String text) {
    print('\x1B[35m$text\x1B[0m');
  }

  static void printCyanText(String text) {
    print('\x1B[36m$text\x1B[0m');
  }

  static void printWhiteText(String text) {
    print('\x1B[37m$text\x1B[0m');
  }

  static void launchURL(String url) async {
    if (!await canLaunchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
    await launchUrl(Uri.parse(url));
  }
}
