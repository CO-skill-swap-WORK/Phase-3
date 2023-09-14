import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:lottie/lottie.dart';

handleErrors({required String messageError}) {
  if (messageError == "user-not-found") {
    const StateRenders();
  }
}

class StateRenders extends StatelessWidget {
  const StateRenders({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LottieBuilder.asset(JsonAssetes.logoJson),
    );
  }
}

GetSnackBar snackbar() {
  return const GetSnackBar(title: ("Error"));
}

class LodingState extends StatelessWidget {
  const LodingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LottieBuilder.asset(JsonAssetes.logoJson),
    );
  }
}

class SignInWithEmailAndPasswordFailuer extends StatelessWidget
    implements Exception {
  final String error;

  const SignInWithEmailAndPasswordFailuer({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    throw Card(
      child: Column(
        children: [
          Text(error),
          LottieBuilder.asset(JsonAssetes.logoJson),
        ],
      ),
    );
  }
}
