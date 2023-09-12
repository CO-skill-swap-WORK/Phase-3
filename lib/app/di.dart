// this is file for Dependency Injection

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppMoudle() async {
  // app prefernce
  final sharedprefernce = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedprefernce);
}
