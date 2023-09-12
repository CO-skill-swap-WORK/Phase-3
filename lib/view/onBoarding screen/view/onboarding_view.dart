import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/duration_consepts.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';
import 'package:ieee_app/domain/models/base_models.dart';
import 'package:ieee_app/view/onBoarding%20screen/view_model/onboarding_view_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  // final SharedPreferncesApp _sharedPreferncesApp =
  //     instance<SharedPreferncesApp>();

  buind() {
    _viewModel.start();
    // _sharedPreferncesApp.setOnboarding();
  }

  @override
  void initState() {
    buind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.outputSliderViewObject,
      builder: (BuildContext context, snapshot) {
        return _getWidgetData(snapshot.data);
      },
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Widget _getWidgetData(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.primaryColorOfWhite,
        appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: ColorManager.primaryColorOfWhite,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primaryColorOfWhite,
            statusBarBrightness: Brightness
                .dark, // this is mean is the wifi icon and any icon show in your phone is will be a dark icon
          ),
        ),
        body: PageView.builder(
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (value) {
            _viewModel.onPageChanged(value);
          },
          itemBuilder: (context, int index) {
            return OnBoardingPage(
              onBoardingModel: sliderViewObject.onBoarding,
            );
          },
          controller: _pageController,
        ),
        bottomSheet: Container(
          width: double.infinity,
          color: ColorManager.primaryColorOfWhite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // this is for skip button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    StringConsant.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteManager.roleRoute,
                    );
                  },
                ),
              ),
              // this is for indicator
              _getWidgetIndicator(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getWidgetIndicator(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primaryColorOrange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: const SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: Icon(Icons.arrow_left_rounded)),
              // go to previous slide
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goPrevious(),
                  duration: const Duration(
                      milliseconds: DurationConsepts.dutrationTime),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),
          //indcator
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getCircleIndcator(i, sliderViewObject.currentIndex),
                )
            ],
          ),
          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: const SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: Icon(Icons.arrow_right_rounded)),
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goNext(),
                  duration: const Duration(
                      milliseconds: DurationConsepts.dutrationTime),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircleIndcator(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(SvgAssetes.hollowCircleIc);
    } else {
      return SvgPicture.asset(SvgAssetes.solidCircleIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  const OnBoardingPage({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        // title in any boarding page
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            onBoardingModel.title,
            textAlign: TextAlign.center,
          ),
        ),
        // subTitle in any boarding page
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            onBoardingModel.subTitle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        // images in any boarding page
        SizedBox(
          height: AppSize.s350,
          width: AppSize.s350,
          child: Image.asset(onBoardingModel.imagePath),
        ),
      ],
    );
  }
}
