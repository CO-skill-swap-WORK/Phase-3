import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/domain/models/base_models.dart';
import 'package:ieee_app/view/base/baseviewmodel.dart';
import 'package:ieee_app/view/base/state%20render/state_render_file.dart';
import 'package:ieee_app/view/base/state%20render/state_render_imp.dart';

class SignUpViewModelTasker extends BasedViewModel
    implements SignUpViewModelInput, SignUpViewModelOutput {
  final StreamController _allInputsStreamController =
      StreamController<void>.broadcast();

  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  final StreamController _userPasswordStreamController =
      StreamController<String>.broadcast();

  final StreamController _userEmailStreamController =
      StreamController<String>.broadcast();

  final StreamController _userConfirmPasswordStreamController =
      StreamController<String>.broadcast();

  final StreamController _userNationalIdStreamController =
      StreamController<String>.broadcast();

  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  final _createNewUserModel = CreateNewUserModel(
    userType: "Tasker",
    name: "",
    email: "",
    password: "",
    nationalId: "",
  );

  String confirmPassword = "";

  @override
  void dispose() {
    _allInputsStreamController.close();
    _userNameStreamController.close();
    _userEmailStreamController.close();
    _userPasswordStreamController.close();
    _userConfirmPasswordStreamController.close();
    _userNationalIdStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  void start() {
    inputState.add(ContentStateImp());
  }

  //input
  @override
  Sink get areAllInputsValidInputSink => _allInputsStreamController.sink;

  @override
  Sink get userConfirmPasswordInputSink =>
      _userConfirmPasswordStreamController.sink;

  @override
  Sink get userEmailInputSink => _userEmailStreamController.sink;

  @override
  Sink get userNameInputSink => _userNameStreamController.sink;

  @override
  Sink get userPasswordInputSink => _userPasswordStreamController.sink;

  @override
  Sink get nationIdInputSink => _userNationalIdStreamController.sink;

// output
  @override
  Stream<bool> get areAllInputsValidOutputsStream =>
      _allInputsStreamController.stream.map((_) => _checkAllValues());

  @override
  Stream<bool> get outIsEmailValidStream => _userEmailStreamController.stream
      .map((email) => _checkEmail(email: email));

  @override
  Stream<bool> get outIsPasswordValidStream =>
      _userPasswordStreamController.stream.map(
        (password) => _checkePassword(password: password),
      );

  @override
  Stream<bool> get outIsUserNameValidStream => _userNameStreamController.stream
      .map((userName) => _checkUserName(userName: userName));

  @override
  Stream<bool> get outNationalIdStream => _userNationalIdStreamController.stream
      .map((userNationId) => _checkAboutNationlId(nationId: userNationId));

  @override
  Stream<bool> get outIsConfirmPasswordValidStream =>
      _userConfirmPasswordStreamController.stream.map((userConfirmPassword) =>
          _checkConfirmPassword(confirmPassword: userConfirmPassword));

//private function
  bool _checkAllValues() {
    return _checkUserName(userName: _createNewUserModel.name) &&
        _checkEmail(email: _createNewUserModel.email) &&
        _checkePassword(password: _createNewUserModel.password) &&
        _checkConfirmPassword(confirmPassword: confirmPassword) &&
        _checkAboutNationlId(nationId: _createNewUserModel.nationalId);
  }

  bool _checkEmail({required String email}) {
    return email.isNotEmpty;
  }

  bool _checkePassword({required String password}) {
    return password.length >= 8;
  }

  bool _checkUserName({required String userName}) {
    return userName.isNotEmpty;
  }

  bool _checkAboutNationlId({required String nationId}) {
    return nationId.length == 14;
  }

  bool _checkConfirmPassword({required String confirmPassword}) {
    return confirmPassword ==
        _createNewUserModel
            .password; // this is password is string value will saved from user and you need to check with confirmPassword Value
  }

// function for set Data
  @override
  login() async {
    final newUser = FirebaseAuth.instance;
    final upLoadUserData = FirebaseFirestore.instance.collection('user/');
    inputState.add(
        LoadingStateImp(stateRendererType: StateRendererType.popupLodingState));
    try {
      await upLoadUserData.add(
        _createNewUserModel.toJson(),
      );
      await newUser.createUserWithEmailAndPassword(
        email: _createNewUserModel.email,
        password: _createNewUserModel.password,
      );
      inputState.add(ContentStateImp());
      isUserLoggedInSuccessfullyStreamController.add(true);
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        inputState.add(ErrorStateImp(
          message: StringConsant.emailErrorStateRender,
          stateRendererType: StateRendererType.popupErrorState,
        ));
      } else if (error.code == "invalid-email") {
        inputState.add(ErrorStateImp(
          message: StringConsant.emailError,
          stateRendererType: StateRendererType.popupErrorState,
        ));
      } else if (error.code == "operation-not-allowed") {
        inputState.add(ErrorStateImp(
          message: StringConsant.tryAgainLater,
          stateRendererType: StateRendererType.popupErrorState,
        ));
      } else if (error.code == "weak-password") {
        inputState.add(ErrorStateImp(
          message: StringConsant.tryAgainLater,
          stateRendererType: StateRendererType.popupErrorState,
        ));
      }
    }
  }

  @override
  setUserName({required String userName}) {
    userNameInputSink.add(userName);
    _createNewUserModel.name = userName;
    areAllInputsValidInputSink.add(null);
  }

  @override
  setEmail({required String userEmail}) {
    userEmailInputSink.add(userEmail);
    _createNewUserModel.email = userEmail;
  }

  @override
  setPassword({required String userPassword}) {
    userPasswordInputSink.add(userPassword);
    _createNewUserModel.password = userPassword;
  }

  @override
  setConfirmPassword({required String userConfirmPassword}) {
    userConfirmPasswordInputSink.add(userConfirmPassword);
    confirmPassword = userConfirmPassword;
  }

  @override
  setNationlId({required String userNationlId}) {
    nationIdInputSink.add(userNationlId);
    _createNewUserModel.nationalId = userNationlId;
  }
}

mixin SignUpViewModelInput {
  setUserName({required String userName});
  setEmail({required String userEmail});
  setPassword({required String userPassword});
  setConfirmPassword({required String userConfirmPassword});
  setNationlId({required String userNationlId});
  login();

  Sink get userNameInputSink;
  Sink get nationIdInputSink;
  Sink get userEmailInputSink;
  Sink get userPasswordInputSink;
  Sink get userConfirmPasswordInputSink;
  Sink get areAllInputsValidInputSink;
}
mixin SignUpViewModelOutput {
  Stream<bool> get outIsUserNameValidStream;
  Stream<bool> get outIsEmailValidStream;
  Stream<bool> get outIsPasswordValidStream;
  Stream<bool> get outIsConfirmPasswordValidStream;
  Stream<bool> get outNationalIdStream;
  Stream<bool> get areAllInputsValidOutputsStream;
}
