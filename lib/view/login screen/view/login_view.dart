import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';
import 'package:ieee_app/app/resourse/widgets/input_filed.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p16),
                child: Text(
                  StringConsant.welcomeBack,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: TextFiledCustome(
              controller: controller,
              title: StringConsant.email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: TextFiledCustome(
              controller: controller,
              title: StringConsant.password,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p14),
                child: TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(RouteManager.forgetPasswordRoute),
                  child: Text(
                    StringConsant.forgetPassword,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorManager.primaryColorBlack,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: ColorManager.primaryColorOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s14),
              ),
              padding: const EdgeInsets.only(
                left: AppPadding.p100,
                right: AppPadding.p100,
                top: AppPadding.p14,
                bottom: AppPadding.p14,
              ),
            ),
            child: Text(
              StringConsant.login,
              style: TextStyle(
                color: ColorManager.primaryColorWhite,
                fontSize: FontSize.s18f,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
