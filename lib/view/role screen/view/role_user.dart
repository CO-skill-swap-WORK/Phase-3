import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _screen(context);
  }

  Scaffold _screen(context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColorOfWhite,
      appBar: _appBar(),
      body: _body(context),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorManager.primaryColorOfWhite,
      elevation: AppSize.s0,
    );
  }

  Padding _body(context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.s20),
      child: Column(
        children: [
          frame(whicheFrame: ImageAssetes.frame2),
          const SizedBox(
            height: AppSize.s100,
          ),
          Row(
            children: [
              typeOfUser(
                type: "Tasker",
                chooseYorColor: ColorManager.primaryColorGreen,
                context: context,
              ),
              typeOfUser(
                  context: context,
                  type: "Customer",
                  chooseYorColor: ColorManager.primaryColorOrange),
            ],
          ),
          const SizedBox(
            height: AppSize.s100,
          ),
          frame(whicheFrame: ImageAssetes.frame1),
        ],
      ),
    );
  }

  Padding frame({required String whicheFrame}) {
    return Padding(
      padding: EdgeInsets.only(
        top: whicheFrame == ImageAssetes.frame2 ? AppPadding.p28 : 0,
        left: whicheFrame == ImageAssetes.frame1 ? AppPadding.p290 : 0,
      ),
      child: Row(
        children: [
          Image.asset(
            whicheFrame,
          )
        ],
      ),
    );
  }

  InkWell typeOfUser({
    required String type,
    required Color chooseYorColor,
    context,
  }) {
    return InkWell(
      onTap: () => _typeOfUserFunction(typeUser: type, context: context),
      child: typeOfUserView(chooseYorColor, type),
    );
  }

  _typeOfUserFunction({
    required String typeUser,
    context,
  }) {
    if (typeUser == "Tasker") {
      Navigator.of(context)
          .pushReplacementNamed(RouteManager.signUpTaskerRoute);
    } else {
      Navigator.of(context)
          .pushReplacementNamed(RouteManager.switchCustomerRoute);
    }
  }

  Padding typeOfUserView(Color chooseYorColor, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Container(
        width: AppSize.s140,
        height: AppSize.s140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s18),
          border: Border.all(
            color: chooseYorColor,
            width: AppSize.s4,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: chooseYorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
