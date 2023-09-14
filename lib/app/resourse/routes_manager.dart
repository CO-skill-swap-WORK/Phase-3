// this is class for Manage Route pages

import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/view/chat%20screen/view/chat_view.dart';
import 'package:ieee_app/view/forgetPassword%20screen/view/forget_password_view.dart';
import 'package:ieee_app/view/home%20screen/view/home_view.dart';
import 'package:ieee_app/view/messages%20screen/view/message_view.dart';
import 'package:ieee_app/view/onBoarding%20screen/view/onboarding_view.dart';
import 'package:ieee_app/view/payment%20screen/view/payment_view.dart';
import 'package:ieee_app/view/post%20screen/view/post_view.dart';
import 'package:ieee_app/view/postalCode%20screen/view/postcode_view.dart';
import 'package:ieee_app/view/role%20screen/view/role_user.dart';
import 'package:ieee_app/view/singup/signUp%20Tasker%20screen/view/tasker_signup.dart';
import 'package:ieee_app/view/singup/signUp%20customer%20screen/switch_login.dart';
import 'package:ieee_app/view/splash%20screen/view/splash_view.dart';

class RouteManager {
  static const splashRoute = '/';
  static const onBoardingRoute = '/onBoarding';
  static const loginRoute = '/login';
  static const forgetPasswordRoute = '/forgetPassword';
  static const postCodeRoute = '/postCode';
  static const homeRoute = '/home';
  static const paymentRoute = '/payment';
  static const postRoute = '/post';
  static const chatRoute = '/chat';
  static const messageRoute = '/message';
  static const roleRoute = '/role';

  static const signUpTaskerRoute = '/signUpTasker';
  static const switchCustomerRoute = '/switchCustomerRoute';
}

class RouteGenerate {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteManager.switchCustomerRoute:
        return MaterialPageRoute(builder: (_) => const SwitchSignUpLogin());
      case RouteManager.signUpTaskerRoute:
        return MaterialPageRoute(builder: (_) => const SignUpTaskerView());
      case RouteManager.postCodeRoute:
        return MaterialPageRoute(builder: (_) => const PostCodeView());
      case RouteManager.postRoute:
        return MaterialPageRoute(builder: (_) => const PostView());
      case RouteManager.paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentView());
      case RouteManager.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case RouteManager.messageRoute:
        return MaterialPageRoute(builder: (_) => const MessagesView());
      case RouteManager.loginRoute:
      case RouteManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RouteManager.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case RouteManager.chatRoute:
        return MaterialPageRoute(builder: (_) => const ChatView());
      case RouteManager.roleRoute:
        return MaterialPageRoute(builder: (_) => const RoleScreen());

      default:
        return unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringConsant.errorMessageAppBar),
        ),
        body: const Center(
          child: Text(
            StringConsant.errorMessageBody,
          ),
        ),
      ),
    );
  }
}
