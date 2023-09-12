import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';

class TextFiledCustome extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const TextFiledCustome({
    super.key,
    required this.title,
    required this.controller,
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
          focusNode: FocusNode(canRequestFocus: true),
          controller: controller,
          decoration: InputDecoration(
            focusColor: ColorManager.primaryColorBlack,
            filled: true,
            fillColor: ColorManager.primaryColorWhite,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
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
