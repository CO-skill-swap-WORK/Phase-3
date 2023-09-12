import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyOnBoardingScreenViewd = "prefsKeyOnBoardingScreenViewd";

class SharedPreferncesApp {
  final SharedPreferences _preferences;
  SharedPreferncesApp(this._preferences);

  // onBoarding Screen
  Future<void> setOnboarding() async {
    await _preferences.setBool(prefsKeyOnBoardingScreenViewd, true);
  }

  Future<bool> getOnboarding() async {
    return _preferences.getBool(prefsKeyOnBoardingScreenViewd) ?? false;
  }
}
