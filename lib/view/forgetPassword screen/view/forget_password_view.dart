import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';
import 'package:ieee_app/app/resourse/widgets/custome_appbar.dart';
import 'package:ieee_app/app/resourse/widgets/input_filed.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColorOfWhite,
      appBar: AppBarCutome.appBar(
        context,
        whichRoute: RouteManager.switchCustomerRoute,
      ),
      body: _body(),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: AppSize.s100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _paddingWidget(
              Text(
                StringConsant.forgetPassword,
                style: TextStyle(
                  color: ColorManager.textColorBlueBlack,
                  fontSize: FontSize.s32f,
                  fontFamily: FontConstants.fontfamily,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            _paddingWidget(
              Text(
                StringConsant.forgetPasswordBodey,
                style: TextStyle(
                  color: ColorManager.textColorBlueBlack,
                  fontSize: FontSize.s16f,
                  fontFamily: FontConstants.fontfamily,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s32,
            ),
            _paddingWidget(
              Text(
                StringConsant.emailPhoneNumber,
                style: TextStyle(
                  fontFamily: FontConstants.fontfamily,
                  fontSize: FontSize.s20f,
                  color: ColorManager.textColorBlueBlack,
                ),
              ),
            ),
            _paddingWidget(
              TextFiledCustome(title: "", controller: controller),
            ),
            const SizedBox(
              height: AppSize.s60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColorOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s16),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.only(
                          left: AppSize.s80,
                          right: AppSize.s80,
                          top: AppSize.s12,
                          bottom: AppSize.s12)),
                  onPressed: () {},
                  child: const Text(
                    StringConsant.next,
                    style: TextStyle(fontSize: FontSize.s22f),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding _paddingWidget(Widget wicheWidget) {
    return Padding(
      padding:
          const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
      child: wicheWidget,
    );
  }
}

  

// } Padding(
//           padding: const EdgeInsets.only(left: AppPadding.p20),
//           child: 
//           ),
//         ),

  // Padding(
  //         padding: const EdgeInsets.only(left: AppPadding.p20),
          // child: 
  //       ),


//  Padding(
//           padding: const EdgeInsets.only(right: AppPadding.p20,left: AppPadding.p20),
          // child: 
//         )