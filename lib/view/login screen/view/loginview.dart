import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';
import 'package:ieee_app/app/resourse/widgets/input_filed.dart';
import 'package:ieee_app/view/base/state%20render/state_render_imp.dart';
import 'package:ieee_app/view/login%20screen/view_model/login_view_model.dart';

class LoginViewNew extends StatefulWidget {
  const LoginViewNew({super.key});

  @override
  State<LoginViewNew> createState() => _LoginViewNewState();
}

class _LoginViewNewState extends State<LoginViewNew> {
  final _formKey = GlobalKey<FormState>();

  final LoginViewModel _viewModel = LoginViewModel();
  final TextEditingController _userNameTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  // final SharedAppData _appPrefernces = instance<SharedAppData>();

  // this is function for merge between viewModel and view
  _bind() {
    _viewModel.start(); // tell viewModel start your job

    // _viewModel.isUserLoggedInSuccessfullyStreamController.stream
    //     .listen((isLoggedIn) {
    //   if (isLoggedIn) {
    //     //navigate to main screen
    //     SchedulerBinding.instance.addPostFrameCallback((_) {
    //       _appPrefernces.setUserLoggedIn();
    //       Navigator.of(context).pushReplacementNamed(RoutesManager.mainRoute);
    //     });
    //   }
    // });

    _userNameTextController.addListener(
        () => _viewModel.setUserName(_userNameTextController.text));

    _passwordTextController.addListener(
        () => _viewModel.setPassword(_passwordTextController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outPutState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
              _viewModel.login();
            }) ??
            _getContentWidget();
      },
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppPadding.p30, left: AppPadding.p30),
                    child: Text(
                      StringConsant.welcomeBack,
                      style: TextStyle(
                        fontSize: FontSize.s28f,
                        fontFamily: FontConstants.fontfamily,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outIsUserNameValidStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextFiledCustome(
                      inputKeyboardFromUser: TextInputType.emailAddress,
                      title: StringConsant.email,
                      controller: _userNameTextController,
                      snapshot: snapshot,
                      textError: StringConsant.emailError,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outIsPasswordValidStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextFiledCustome(
                      secureText: true,
                      inputKeyboardFromUser: TextInputType.visiblePassword,
                      title: StringConsant.password,
                      controller: _passwordTextController,
                      snapshot: snapshot,
                      textError: StringConsant.passwordError,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppSize.s28, right: AppSize.s28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouteManager.forgetPasswordRoute);
                      },
                      child: Text(
                        StringConsant.forgetPassword,
                        style: TextStyle(
                          color: ColorManager.textColorBlueBlack,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: StreamBuilder<bool>(
                  stream: _viewModel.areAllInputsValidOutputsStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return SizedBox(
                      width: AppSize.s100,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryColorOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _viewModel.login();
                              }
                            : null,
                        child: const Text(StringConsant.login),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
