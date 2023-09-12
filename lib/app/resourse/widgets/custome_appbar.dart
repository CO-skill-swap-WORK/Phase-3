import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';

class AppBarCutome {
  static AppBar appBar(BuildContext context, {required String whichRoute}) {
    return AppBar(
      backgroundColor: ColorManager.primaryColorOfWhite,
      elevation: 0,
      title: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(whichRoute);
          },
          icon: Icon(
            color: ColorManager.primaryColorBlack,
            Icons.arrow_back,
          )),
    );
  }
}
