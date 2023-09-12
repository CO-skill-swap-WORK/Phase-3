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
  _startDely() {
    Timer(const Duration(seconds: DurationConsepts.dutrationTime), () {
      Navigator.pushReplacementNamed(context, RouteManager.onBoardingRoute);
    });
  }

  @override
  void initState() {
    super.initState;
    _startDely();
  }

  @override
  Widget build(BuildContext context) {
    return _screen();
  }

  _screen() {
    return Scaffold(
      backgroundColor: ColorManager.primaryColorOfWhite,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColorOfWhite,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primaryColorOfWhite),
      ),
      body: Center(
        child: SizedBox(
          height: AppSize.s350,
          width: AppSize.s350,
          child: Image.asset(ImageAssetes.logo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
