import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ieee_app/view/base/baseviewmodel.dart';
import 'package:ieee_app/view/base/state%20render/state_render_file.dart';
import 'package:ieee_app/view/base/state%20render/state_render_imp.dart';

// import 'package:freezed/builder.dart';// freezed package used for data class

class LoginViewModelTasker extends BasedViewModel
    implements LoginViewModelInputs, LoginViewModelsOutputs {
  final StreamController _userNameStreamController = StreamController<
      String>.broadcast(); // this is broadcast make my streamcontroller has many listeners

  final StreamController _passwordStreamController = StreamController<
      String>.broadcast(); // this is broadcast make my streamcontroller has many listeners

  final StreamController _areInputsValidStreamController = StreamController<
      void>.broadcast(); // this is broadcast make my streamcontroller has many listeners

  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  String passwordInput = "";
  String emailInput = "";

  // inputs from user
  @override
  void dispose() {
    super.dispose();
    _passwordStreamController.close();
    _userNameStreamController.close();
    _areInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    //view model should tell view please show content state

    inputState.add(ContentStateImp());
  }

  @override
  Sink get inputPasswordSink {
    return _passwordStreamController.sink;
  }

  @override
  Sink get inputUserNameSink {
    return _userNameStreamController.sink;
  }

  @override
  Sink get areAllInputsValidInputsSink {
    return _areInputsValidStreamController.sink;
  }

  @override
  login(context) async {
    final instance = FirebaseAuth.instance;
    inputState.add(
      LoadingStateImp(stateRendererType: StateRendererType.popupLodingState),
    );
    try {
      await instance.signInWithEmailAndPassword(
          email: emailInput, password: passwordInput);
      inputState.add(ContentStateImp());
      isUserLoggedInSuccessfullyStreamController.add(true);
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        inputState.add(
          ErrorStateImp(
              stateRendererType: StateRendererType.popupErrorState,
              message: "Invalid Email"),
        );
      } else if (error.code == "user-disabled") {
        inputState.add(
          ErrorStateImp(
              stateRendererType: StateRendererType.popupErrorState,
              message: "User Not Found"),
        );
      } else if (error.code == "user-not-found") {
        inputState.add(
          ErrorStateImp(
              stateRendererType: StateRendererType.popupErrorState,
              message: "User Not Found"),
        );
      } else if (error.code == "wrong-password") {
        inputState.add(
          ErrorStateImp(
              stateRendererType: StateRendererType.popupErrorState,
              message: "Wrong Password"),
        );
      }
    } // finally {
    // }
  }
  // outputs

  @override
  Stream<bool> get outIsPasswordValidStream => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValidStream => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get areAllInputsValidOutputsStream =>
      _areInputsValidStreamController.stream.map((_) => _areInputsValid());

//private function
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areInputsValid() {
    return _isPasswordValid(passwordInput) && _isUserNameValid(emailInput);
  }

// function for set data from user
  @override
  setPassword(String password) {
    inputPasswordSink.add(password);
    passwordInput =
        password; // this is make update for login object after user enter input password
    areAllInputsValidInputsSink.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserNameSink.add(userName);
    emailInput =
        userName; // this is make update for login object after user enter input username
  }
}

abstract class LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login(context);

  Sink get areAllInputsValidInputsSink;
  Sink get inputUserNameSink;
  Sink get inputPasswordSink;
}

abstract class LoginViewModelsOutputs {
  Stream<bool> get outIsUserNameValidStream;
  Stream<bool> get outIsPasswordValidStream;
  Stream<bool> get areAllInputsValidOutputsStream;
}
