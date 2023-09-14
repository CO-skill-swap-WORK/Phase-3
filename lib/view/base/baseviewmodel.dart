// // this is Based View Model this is class have any variable or function will be used through any view model

// abstract class BasedViewModel extends BaseViewModelInput
//     implements BasedViewModelOutput {}

// // this is based for any event or any click fuction or variable
// abstract class BaseViewModelInput {
//   dispose();
//   start();
// }

// // this is based for any output from any api and have it from based input value will be excute from viewModel and will send for view
// abstract class BasedViewModelOutput {}
// this is Based View Model this is class have any variable or function will be used through any view model

import 'dart:async';

import 'package:ieee_app/view/base/state%20render/state_render_imp.dart';

abstract class BasedViewModel extends BaseViewModelInput
    implements BasedViewModelOutput {
  final StreamController _inputStreamController =
      StreamController<FlowState>.broadcast();

  @override
  void dispose() {
    _inputStreamController.close();
  }

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outPutState =>
      _inputStreamController.stream.map((flowstate) => flowstate);
}

// this is based for any event or any click fuction or variable
abstract class BaseViewModelInput {
  void start(); // start viewModel jobs

  void dispose(); // will be import or called when view model dies

  Sink get inputState;
}

// this is based for any output from any api and have it from based input value will be excute from viewModel and will send for view
abstract class BasedViewModelOutput {
  Stream<FlowState> get outPutState;
}
