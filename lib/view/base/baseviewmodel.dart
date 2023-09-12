// this is Based View Model this is class have any variable or function will be used through any view model

abstract class BasedViewModel extends BaseViewModelInput
    implements BasedViewModelOutput {}

// this is based for any event or any click fuction or variable
abstract class BaseViewModelInput {
  dispose();
  start();
}

// this is based for any output from any api and have it from based input value will be excute from viewModel and will send for view
abstract class BasedViewModelOutput {}
