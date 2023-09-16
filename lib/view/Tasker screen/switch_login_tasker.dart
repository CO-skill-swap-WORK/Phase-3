import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';
import 'package:ieee_app/app/resourse/widgets/custome_appbar.dart';
import 'package:ieee_app/view/Tasker%20screen/login%20screen/view/login_view_tasker.dart';
import 'package:ieee_app/view/Tasker%20screen/signUp%20Screen/view/tasker_signup.dart';

class SwitchSignUpLoginTasker extends StatefulWidget {
  const SwitchSignUpLoginTasker({super.key});

  @override
  State<SwitchSignUpLoginTasker> createState() =>
      _SwitchSignUpLoginTaskerState();
}

class _SwitchSignUpLoginTaskerState extends State<SwitchSignUpLoginTasker> {
  bool isPreesed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColorOfWhite,
      appBar: AppBarCutome.appBar(context, whichRoute: RouteManager.roleRoute),
      body: _body(),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: AppSize.s40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _switch(title: StringConsant.login, isPressed: isPreesed),
                _switch(title: StringConsant.signup, isPressed: isPreesed),
              ],
            ),
            isPreesed ? const LoginViewTasker() : const SignUpTaskerView(),
          ],
        ),
      ),
    );
  }

  GestureDetector _switch({required String title, required bool isPressed}) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        setState(() {
          isPreesed = title == StringConsant.login ? true : false;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: AppSize.s140,
        height: AppSize.s40,
        decoration: BoxDecoration(
          border: (isPreesed && title == StringConsant.login) ||
                  (isPreesed == false && title == StringConsant.signup)
              ? null
              : Border.all(
                  color: ColorManager.primaryColorGreen,
                  width: AppSize.s1_5,
                ),
          borderRadius: BorderRadius.circular(15),
          color: (isPreesed && title == StringConsant.login) ||
                  (isPreesed == false && title == StringConsant.signup)
              ? ColorManager.primaryColorGreen
              : ColorManager.primaryColorWhite,
        ),
        child: Text(
          title,
          style: TextStyle(
              color: (isPreesed && title == StringConsant.login) ||
                      (isPreesed == false && title == StringConsant.signup)
                  ? ColorManager.primaryColorWhite
                  : ColorManager.primaryColorGreen,
              fontSize: AppSize.s18,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
