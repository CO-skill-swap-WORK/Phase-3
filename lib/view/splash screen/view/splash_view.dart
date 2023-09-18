import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ieee_app/app/duration_consepts.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<StatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(
      const Duration(seconds: DurationConsepts.dutrationTime),
      () => Navigator.of(context)
          .pushReplacementNamed(RouteManager.onBoardingRoute),
    );
  }

  @override
  void initState() {
    super.initState;
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return _screen();
  }

  _screen() {
    return Scaffold(
      backgroundColor: ColorManager.splashScreenColor,
      appBar: AppBar(
        backgroundColor: ColorManager.splashScreenColor,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.primaryColorWhite,
        ),
      ),
      body: Center(
        child: SizedBox(
          height: AppSize.s350,
          width: AppSize.s350,
          child: Image.asset(ImageAssetesPath.logo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
