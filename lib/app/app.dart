import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';

class MyApp extends StatefulWidget {
  // singleTon for this constractor
  const MyApp._();
  static const MyApp _instance = MyApp._();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerate.getRoute,
      initialRoute: RouteManager.splashRoute,
    );
  }
}
