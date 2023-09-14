import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType {
  // Popup States (Dialog)
  popupLodingState,
  popupErrorState,

  // full screen state (full screen)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // success state
  success,

  // general
  contentState,
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function retryActionFunction;

  const StateRenderer(
      {super.key,
      required this.stateRendererType,
      this.message = StringConsant.loadingState,
      this.title = "",
      required this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLodingState:
        return _getPopupDialog(
            context, [_getAnimatedImage(JsonAssetes.loading)]);

      case StateRendererType.popupErrorState:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAssetes.error),
          _getMessage(message),
          _getRetryButton(context, StringConsant.ok)
        ]);

      case StateRendererType.fullScreenLoadingState:
        return _getItemColumn(
          [
            _getAnimatedImage(JsonAssetes.loading),
            _getMessage(message),
          ],
        );

      case StateRendererType.fullScreenErrorState:
        return _getItemColumn(
          [
            _getAnimatedImage(JsonAssetes.error),
            _getMessage(message),
            _getRetryButton(context, StringConsant.retryAgain),
          ],
        );

      case StateRendererType.fullScreenEmptyState:
        return _getItemColumn(
          [
            _getAnimatedImage(JsonAssetes.empty),
            _getMessage(message),
          ],
        );

      case StateRendererType.success:
        return _getItemColumn(
          [
            _getAnimatedImage(JsonAssetes.success),
            _getMessage(StringConsant.success),
          ],
        );

      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopupDialog(BuildContext context, List<Widget> childern) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.primaryColorWhite,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(color: Colors.black26),
          ],
        ),
        child: _getDialogContent(context, childern),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> childrenList) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: childrenList,
    );
  }

  Widget _getRetryButton(BuildContext context, String message) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primaryColorOrange,
          ),
          onPressed: () {
            if (stateRendererType == StateRendererType.fullScreenEmptyState) {
              // state in FullScreenError
              // call retry function
              retryActionFunction.call();
            } else {
              // popupErrorState
              Navigator.of(context, rootNavigator: true).pop();
            }
          },
          child: Text(
            message,
            style: const TextStyle(
                fontFamily: FontConstants.fontfamily, fontSize: FontSize.s18f),
          ),
        ),
      ),
    );
  }

  Widget _getItemColumn(List<Widget> childrenList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: childrenList,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: TextStyle(
            color: ColorManager.textColorBlueBlack,
            fontSize: FontSize.s20f,
          ),
        ),
      ),
    );
  }
}
