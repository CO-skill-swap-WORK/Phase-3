import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyOnBoardingScreenViewd = "prefsKeyOnBoardingScreenViewd";

class SharedPreferncesApp {
  final SharedPreferences preferences;

  SharedPreferncesApp({required this.preferences});

  // onBoarding Screen
  Future<void> setOnboarding() async {
    await preferences.setBool(prefsKeyOnBoardingScreenViewd, true);
  }

  Future<bool> getOnboarding() async {
    return preferences.getBool(prefsKeyOnBoardingScreenViewd) ?? false;
  }
}
