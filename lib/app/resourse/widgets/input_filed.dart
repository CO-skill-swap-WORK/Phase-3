import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';

class TextFiledCustome extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String textError;
  final AsyncSnapshot snapshot;
  final TextInputType inputKeyboardFromUser;
  final bool secureText;
  const TextFiledCustome({
    super.key,
    required this.title,
    required this.controller,
    required this.snapshot,
    required this.textError,
    required this.inputKeyboardFromUser,
    required this.secureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSize.s4),
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        TextField(
          obscureText: secureText ? true : false,
          keyboardType: inputKeyboardFromUser,
          focusNode: FocusNode(canRequestFocus: true),
          controller: controller,
          decoration: InputDecoration(
            errorText: (snapshot.data ?? true) ? null : textError,
            focusColor: ColorManager.primaryColorBlack,
            filled: true,
            fillColor: ColorManager.primaryColorWhite,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.primaryColorBlack,
              ),
              borderRadius: BorderRadius.circular(
                AppSize.s10,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppSize.s10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
