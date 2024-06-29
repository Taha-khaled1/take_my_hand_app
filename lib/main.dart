import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:take_hand/application_layer/app/myapp.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Gemini.init(apiKey: 'AIzaSyBsrmxYNSTZF8YJmp4e-kPO_TouFaLezZU');

  sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("lang", 'ar');
  sharedPreferences.setBool("is_dark", true);
  await MobileAds.instance.initialize();
  // await Firebase.initializeApp();
  runApp(
    const MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
  );
}
