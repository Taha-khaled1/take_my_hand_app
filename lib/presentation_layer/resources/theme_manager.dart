// ignore_for_file: deprecated_member_use

import 'package:take_hand/main.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

ThemeData getApplicationTheme() {
  if (sharedPreferences.getBool("is_dark") == true) {
    return ThemeData(
      backgroundColor: Color(0xff1F222A),
      colorScheme: ColorScheme.dark(
        background: Color(0xff1F222A),
        onPrimary: Color(0xFF7206FC),
        secondary: Color(0xffFFFFFF),
        surface: Color(0xFF1F222A),
      ),
      primaryColor: Color(0xFF7206FC),
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: Color(0xffFFFFFF),
      ),
      appBarTheme: AppBarTheme(backgroundColor: Color(0xff1F222A)),
    );
  } else {
    return ThemeData(
      backgroundColor: Color(0xffFFFFFF),
      primarySwatch: Colors.blue,
      colorScheme: ColorScheme.light(
        background: Color(0xffFFFFFF),
        onPrimary: Color(0xFF7206FC),
        secondary: Color(0xff1F222A),
        surface: Color(0xFFF9F9F9),
      ),
      primaryColor: Color(0xFF7206FC),
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Color(0xff1F222A),
      ),
      textTheme: TextTheme(),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Color(0xffFFFFFF),
        headerBackgroundColor: Color(0xff799CDE),
        weekdayStyle: TextStyle(color: Color.fromARGB(222, 7, 7, 227)),
        headerForegroundColor: Colors.black,
        dayStyle: TextStyle(
          color: Colors.red,
        ),
        todayForegroundColor: MaterialStatePropertyAll(Color(0xFF7206FC)),
        todayBackgroundColor: MaterialStatePropertyAll(Color(0xff799CDE)),
        surfaceTintColor: Colors.red,
        todayBorder: BorderSide.none,
        dayForegroundColor: MaterialStatePropertyAll(Colors.black),
        dayOverlayColor: MaterialStatePropertyAll(
          Colors.black,
        ),
      ),
      appBarTheme: AppBarTheme(backgroundColor: Color(0xffFFFFFF)),
    );
  }
}
