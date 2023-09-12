import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/widgets/input_filed.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFiledCustome(title: "title", controller: TextEditingController())
      ],
    );
  }
}
