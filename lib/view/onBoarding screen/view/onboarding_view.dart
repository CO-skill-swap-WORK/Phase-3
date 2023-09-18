import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
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

  buind() {
    _viewModel.start();
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
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
        backgroundColor: sliderViewObject.onBoarding.backgroundColor,
        appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: sliderViewObject.onBoarding.backgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: sliderViewObject.onBoarding.backgroundColor,
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
          color: sliderViewObject.onBoarding.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // this is for skip button
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: const Text(
                      StringConsant.skip,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: ColorManager.skipColorWhite,
                          fontFamily: FontConstants.fontfamily,
                          fontSize: FontSize.s24f,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RouteManager.roleRoute,
                      );
                    },
                  ),
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
      color: sliderViewObject.onBoarding.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
        ],
      ),
    );
  }

  Widget _getCircleIndcator(int index, int currentIndex) {
    if (index == currentIndex) {
      return SizedBox(
          height: AppSize.s20,
          width: AppSize.s20,
          child: Image.asset(ImageAssetesPath.ellipseBlue));
    } else {
      return SizedBox(
          height: AppSize.s20,
          width: AppSize.s20,
          child: Image.asset(ImageAssetesPath.ellipseWhite));
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
        // images in any boarding page
        SizedBox(
          height: AppSize.s350,
          width: AppSize.s350,
          child: Image.asset(onBoardingModel.imagePath),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        // title in any boarding page
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            onBoardingModel.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: FontConstants.fontfamily,
                fontSize: FontSize.s32f,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
