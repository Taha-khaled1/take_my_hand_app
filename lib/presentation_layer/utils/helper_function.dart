import 'package:fluttertoast/fluttertoast.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class HelperFunction {
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

  static String imageNetworkCheck(String? image) {
    if (image == null || image.isEmpty || image == '') {
      return 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
    }
    return image;
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
}
