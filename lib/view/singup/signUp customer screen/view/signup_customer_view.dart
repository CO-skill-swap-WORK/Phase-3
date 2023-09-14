import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
import 'package:ieee_app/app/resourse/widgets/input_filed.dart';
import 'package:ieee_app/view/base/state%20render/state_render_imp.dart';
import 'package:ieee_app/view/singup/signUp%20customer%20screen/view_model/signup_customer_view_model.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({super.key});

  @override
  State<CustomerSignUp> createState() => _CustomerSignUpState();
}

class _CustomerSignUpState extends State<CustomerSignUp> {
  final _formKey = GlobalKey();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  final TextEditingController _nationalTextController = TextEditingController();
  final SignUpViewModel _viewModel = SignUpViewModel();

  // this is function for merge between viewModel and view
  _bind() {
    _viewModel.start();

    _nameTextController.addListener(() {
      _viewModel.setUserName(userName: _nameTextController.text);
    });

    _emailTextController.addListener(() {
      _viewModel.setEmail(userEmail: _emailTextController.text);
    });

    _passwordTextController.addListener(() {
      _viewModel.setPassword(userPassword: _passwordTextController.text);
    });

    _confirmPasswordTextController.addListener(() {
      _viewModel.setConfirmPassword(
          userConfirmPassword: _confirmPasswordTextController.text);
    });

    _nationalTextController.addListener(() {
      _viewModel.setNationlId(userNationlId: _nationalTextController.text);
    });
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
        return snapshot.data?.getScreenWidget(context, _body(), () {
              _viewModel.login();
            }) ??
            _body();
      },
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            //name
            _inputSignUp(
              controller: _nameTextController,
              secureText: false,
              streamValue: _viewModel.outIsUserNameValidStream,
              title: StringConsant.name,
              textError: StringConsant.nameError,
            ),
            //Email
            _inputSignUp(
              streamValue: _viewModel.outIsEmailValidStream,
              controller: _emailTextController,
              secureText: false,
              title: StringConsant.email,
              textError: StringConsant.emailError,
            ),
            //password
            _inputSignUp(
              streamValue: _viewModel.outIsPasswordValidStream,
              controller: _passwordTextController,
              secureText: true,
              title: StringConsant.password,
              textError: StringConsant.passwordError,
            ),
            // confirmPassword
            _inputSignUp(
              streamValue: _viewModel.outIsConfirmPasswordValidStream,
              controller: _confirmPasswordTextController,
              secureText: true,
              title: StringConsant.confirmPassword,
              textError: StringConsant.confirmPasswordError,
            ),
            // national Id
            _inputSignUp(
              streamValue: _viewModel.outNationalIdStream,
              controller: _nationalTextController,
              secureText: false,
              title: StringConsant.nationalId,
              textError: StringConsant.nationalIdError,
            ),
            //Create new user button
            Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: StreamBuilder<bool>(
                stream: _viewModel.areAllInputsValidOutputsStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s14)),
                        backgroundColor: ColorManager.primaryColorOrange,
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p8,
                            horizontal: AppPadding.p70)),
                    onPressed: (snapshot.data ?? false)
                        ? () {
                            _viewModel.login();
                          }
                        : null,
                    child: const Text(
                      StringConsant.signup,
                      style: TextStyle(
                        fontFamily: FontConstants.fontfamily,
                        fontSize: FontSize.s20f,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _inputSignUp({
    required Stream<bool> streamValue,
    required TextEditingController controller,
    required bool secureText,
    required String title,
    required textError,
  }) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: StreamBuilder<bool>(
        stream: streamValue,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextFiledCustome(
            secureText: secureText,
            inputKeyboardFromUser: TextInputType.visiblePassword,
            title: title,
            controller: controller,
            snapshot: snapshot,
            textError: textError,
          );
        },
      ),
    );
  }
}
