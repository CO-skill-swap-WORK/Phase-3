class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

class SliderViewObject {
  OnBoardingModel onBoarding;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.onBoarding,
    required this.numOfSlides,
    required this.currentIndex,
  });
}
