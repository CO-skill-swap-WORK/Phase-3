import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ieee_app/domain/models/base_models.dart';
import 'package:ieee_app/view/base/baseviewmodel.dart';
import 'package:ieee_app/view/base/state%20render/state_render_file.dart';
import 'package:ieee_app/view/base/state%20render/state_render_imp.dart';

class CreatePostViewModel extends BasedViewModel
    implements CreatePostViewModelInput, CreatePostViewModelOutput {
  final _jobTitleController = StreamController<String>.broadcast();

  final _locationNeedIt = StreamController<String>.broadcast();

  final _descriptionController = StreamController<String>.broadcast();

  final _userNameController = StreamController<String>.broadcast();

  final _checkAllValue = StreamController<void>.broadcast();

  final ifDataEnteredTrue = StreamController<bool>();

  final _createNewPostModel = CreatePostModel(
    userName: "",
    title: "",
    description: "",
    location: "",
    userIdAuthentication: '',
  );

  // we start by enter a content state
  @override
  void start() {
    inputState.add(ContentStateImp());
  }

  @override
  dispose() {
    _jobTitleController.close();
    _locationNeedIt.close();
    _descriptionController.close();
    _checkAllValue.close();
  }

  // sink or entered data
  @override
  Sink get jobTitleSink => _jobTitleController.sink;

  @override
  Sink get jobDescriptionSink => _descriptionController.sink;

  @override
  Sink get jobLocationSink => _locationNeedIt.sink;

  @override
  Sink get checkAllValueSink => _checkAllValue.sink;

  @override
  Sink get userNameSink => _userNameController.sink;

  // Stream or output data

  @override
  Stream<bool> get jobTitleStream =>
      _jobTitleController.stream.map((title) => _checkTitle(title));

  @override
  Stream<bool> get jobDescriptionStream => _descriptionController.stream
      .map((description) => _checkDescriptionValue(description));

  @override
  Stream<bool> get jobLocationStream =>
      _locationNeedIt.stream.map((location) => _checkLocationValue(location));

  @override
  Stream<bool> get checkAllValueStream =>
      _checkAllValue.stream.map((_) => _checkAllValueResult());

  @override
  Stream<bool> get checkUserNameStream =>
      _userNameController.stream.map((title) => _cheUserNameStream(title));

  // private function
  bool _checkDescriptionValue(String descriptionValue) {
    return descriptionValue.isNotEmpty;
  }

  bool _checkLocationValue(String locationValue) {
    return locationValue.isNotEmpty;
  }

  bool _checkTitle(String titleValue) {
    return titleValue.isNotEmpty;
  }

  bool _cheUserNameStream(String titleValue) {
    return titleValue.isNotEmpty;
  }

  bool _checkAllValueResult() {
    return _checkTitle(_createNewPostModel.title) &&
        _checkDescriptionValue(_createNewPostModel.description) &&
        _checkLocationValue(_createNewPostModel.location);
  }

  // set data from user
  @override
  createPost() async {
    inputState.add(
        LoadingStateImp(stateRendererType: StateRendererType.popupLodingState));
    final curentUser = FirebaseAuth.instance.currentUser;
    final instance = FirebaseFirestore.instance.collection('posts/');
    _createNewPostModel.userIdAuthentication = curentUser!.uid;

    try {
      await instance.add(_createNewPostModel.toJson());
      ifDataEnteredTrue.add(true);
      inputState.add(ContentStateImp());
    } catch (e) {
      rethrow;
    }
  }

  @override
  setTitleJob({required String titleJob}) {
    jobTitleSink.add(titleJob);
    _createNewPostModel.title = titleJob;
    checkAllValueSink.add(null);
  }

  @override
  setDescriptionJob({required String descriptionJob}) {
    jobDescriptionSink.add(descriptionJob);
    _createNewPostModel.description = descriptionJob;
  }

  @override
  setLocationJob({required String locationJob}) {
    jobLocationSink.add(locationJob);
    _createNewPostModel.location = locationJob;
  }

  @override
  setUserName({required String customerUserName}) {
    userNameSink.add(customerUserName);
    _createNewPostModel.userName = customerUserName;
  }
}

mixin CreatePostViewModelInput {
  Sink get jobTitleSink;
  Sink get jobDescriptionSink;
  Sink get jobLocationSink;
  Sink get userNameSink;
  Sink get checkAllValueSink;

  createPost();
  setTitleJob({required String titleJob});
  setDescriptionJob({required String descriptionJob});
  setLocationJob({required String locationJob});
  setUserName({required String customerUserName});
}
mixin CreatePostViewModelOutput {
  Stream<bool> get jobTitleStream;
  Stream<bool> get jobDescriptionStream;
  Stream<bool> get jobLocationStream;
  Stream<bool> get checkAllValueStream;
  Stream<bool> get checkUserNameStream;
}
