import 'dart:async';

import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/domain/models/base_models.dart';
import 'package:ieee_app/view/base/baseviewmodel.dart';

class OnBoardingViewModel extends BasedViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<OnBoardingModel> _list;

  int _currentIndex =
      0; // this proberity for change in dirctory and move in pages

  // OnBoarding ViewModel Inputes fuctions and this is shared functoins will be in any view model
  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    int index = ++_currentIndex;
    if (index == _list.length) {
      return 0;
    } else {
      return index;
    }
  }

  @override
  int goPrevious() {
    int index = --_currentIndex;
    if (index < 0) {
      return _list.length - 1;
    } else {
      return index;
    }
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  // onBoarding viewModel input
  @override
  Sink get inputSliderViewObject => _streamController.sink;
  // onBoarding viewModel output

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //private section functions onboarding
  _getSliderData() {
    return [
      OnBoardingModel(
        title: StringConsant.titleDeliveryOnBoardingScreen,
        subTitle: StringConsant.subTitleDeliveryOnBoardingScreen,
        imagePath: ImageAssetesPath.deliverImage,
      ),
      OnBoardingModel(
        title: StringConsant.titleCarPenterOnBoardingScreen,
        subTitle: StringConsant.subTitleCarPenterOnBoardingScreen,
        imagePath: ImageAssetesPath.carPenter,
      ),
      OnBoardingModel(
        title: StringConsant.titleHouseKeeperOnBoardingScreen,
        subTitle: StringConsant.subTitleHouseKeeperOnBoardingScreen,
        imagePath: ImageAssetesPath.houseKeeper,
      ),
    ];
  }

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        onBoarding: _list[_currentIndex],
        numOfSlides: _list.length,
        currentIndex: _currentIndex,
      ),
    );
  }
}

// this is class is spcefic class for fuctions on boarding inputs only
// inputs mean that "Orders" that our view model will receive from view
mixin OnBoardingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe left
  int goPrevious(); // when user clicks on left arrow ro swipe right
  void onPageChanged(int index); // this is like _curentIndex in old version

  // this is will be stream controller input
  Sink get inputSliderViewObject;
}

mixin OnBoardingViewModelOutputs {
  // this is will be stream controller output

  Stream<SliderViewObject> get outputSliderViewObject;
}
