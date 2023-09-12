import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //text theme
    textTheme: TextTheme(
      displayLarge: getExtraBoldTextStyle(
          color: ColorManager.textColorBlueBlack, fontSize: FontSize.s16f),
      headlineLarge: getBoldTextStyle(
          color: ColorManager.textColorBlack, fontSize: FontSize.s18f),
      bodyLarge: getSemiBoldTextStyle(
          color: ColorManager.primaryColorWhite, fontSize: FontSize.s17f),
      headlineMedium: getBlackTextStyle(
          color: ColorManager.primaryColorOrange, fontSize: FontSize.s16f),
      bodyMedium: getMediumTextStyle(
          color: ColorManager.textColorBlueBlack, fontSize: FontSize.s14f),
      // this is for input filed title
      titleMedium: getRegularTextStyle(
          color: ColorManager.textColorBlueBlack, fontSize: FontSize.s20f),

      bodySmall: getLightTextStyle(color: ColorManager.secondaryColorWhite,fontSize: FontSize.s20f),
      displaySmall:
          getExtraLightTextStyle(color: ColorManager.textColorBlueBlack),
      titleSmall: getThinTextStyle(color: ColorManager.textColorBlueBlack),
    ),
  );
}

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontConstants.fontfamily,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

//light style

TextStyle getThinTextStyle(
    {double fontSize = FontSize.s12f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.thin,
    color,
  );
}

TextStyle getExtraLightTextStyle(
    {double fontSize = FontSize.s12f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.extraLight,
    color,
  );
}

TextStyle getLightTextStyle(
    {double fontSize = FontSize.s12f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}

TextStyle getRegularTextStyle(
    {double fontSize = FontSize.s14f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

TextStyle getMediumTextStyle(
    {double fontSize = FontSize.s18f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

TextStyle getBlackTextStyle(
    {double fontSize = FontSize.s18f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.black,
    color,
  );
}

TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSize.s20f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
  );
}

TextStyle getBoldTextStyle(
    {double fontSize = FontSize.s22f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}

TextStyle getExtraBoldTextStyle(
    {double fontSize = FontSize.s22f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}
