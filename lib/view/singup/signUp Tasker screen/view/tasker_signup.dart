import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';
import 'package:ieee_app/app/resourse/widgets/custome_appbar.dart';

class SignUpTaskerView extends StatefulWidget {
  const SignUpTaskerView({super.key});

  @override
  State<SignUpTaskerView> createState() => _SignUpTaskerViewState();
}

class _SignUpTaskerViewState extends State<SignUpTaskerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCutome.appBar(
        context,
        whichRoute: RouteManager.roleRoute,
      ),
    );
  }
}
