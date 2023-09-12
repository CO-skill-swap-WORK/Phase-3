import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:lottie/lottie.dart';

HandleErrors({required String messageError}) {
  switch (messageError) {
    case "user-not-found":
      const StateRenders();
    case "NOT ERROR":
      print("This is test Don't have error");
    default:
  }
}

class StateRenders extends StatelessWidget {
  const StateRenders({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LottieBuilder.asset(JsonAssetes.logoJson),
    );
  }
}


// enum StateRendererType {
//   // Popup States (Dialog)
//   popupLodingState,
//   popupErrorState,

//   // full screen state (full screen)
//   fullScreenLoadingState,
//   fullScreenErrorState,
//   fullScreenEmptyState,

//   // general
//   contentState,
// }

// class StateRenderer extends StatelessWidget {
//   StateRendererType stateRendererType;
//   String message;
//   String title;
//   Function retryActionFunction;

//   StateRenderer(
//       {super.key,
//       required this.stateRendererType,
//       this.message = AppStrings.loadingState,
//       this.title = "",
//       required this.retryActionFunction});

//   @override
//   Widget build(BuildContext context) {
//     return _getStateWidget(context);
//   }

//   Widget _getStateWidget(BuildContext context) {
//     switch (stateRendererType) {
//       case StateRendererType.popupLodingState:
//         return _getPopupDialog(
//             context, [_getAnimatedImage(JsonAssetsManager.loadingState)]);

//       case StateRendererType.popupErrorState:
//         return _getPopupDialog(context, [
//           _getAnimatedImage(JsonAssetsManager.errorState),
//           _getMessage(message),
//           _getRetryButton(context, AppStrings.ok)
//         ]);

//       case StateRendererType.fullScreenLoadingState:
//         return _getItemColumn(
//           [
//             _getAnimatedImage(JsonAssetsManager.loadingState),
//             _getMessage(message),
//           ],
//         );

//       case StateRendererType.fullScreenErrorState:
//         return _getItemColumn(
//           [
//             _getAnimatedImage(JsonAssetsManager.errorState),
//             _getMessage(message),
//             _getRetryButton(context, AppStrings.retryAgain),
//           ],
//         );

//       case StateRendererType.fullScreenEmptyState:
//         return _getItemColumn([
//           _getAnimatedImage(JsonAssetsManager.errorState),
//           _getMessage(message)
//         ]);

//       case StateRendererType.contentState:
//         return Container();
//       default:
//         return Container();
//     }
//   }

//   Widget _getPopupDialog(BuildContext context, List<Widget> childern) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppSize.s14),
//       ),
//       elevation: AppSize.s1_5,
//       backgroundColor: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           color: ColorManager.white,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(AppSize.s14),
//           boxShadow: const [
//             BoxShadow(color: Colors.black26),
//           ],
//         ),
//         child: _getDialogContent(context, childern),
//       ),
//     );
//   }

//   Widget _getDialogContent(BuildContext context, List<Widget> childrenList) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: childrenList,
//     );
//   }

//   Widget _getRetryButton(BuildContext context, String message) {
//     return Padding(
//       padding: const EdgeInsets.all(AppPadding.p18),
//       child: SizedBox(
//         width: double.infinity,
//         child: ElevatedButton(
//           onPressed: () {
//             if (stateRendererType == StateRendererType.fullScreenEmptyState) {
//               // state in FullScreenError
//               // call retry function
//               retryActionFunction.call();
//             } else {
//               // popupErrorState
//               Navigator.of(context, rootNavigator: true).pop();
//             }
//           },
//           child: Text(message),
//         ),
//       ),
//     );
//   }

//   Widget _getItemColumn(List<Widget> childrenList) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: childrenList,
//     );
//   }

//   Widget _getAnimatedImage(String animationName) {
//     return SizedBox(
//       height: AppSize.s100,
//       width: AppSize.s100,
//       child: Lottie.asset(animationName),
//     );
//   }

//   Widget _getMessage(String message) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(AppPadding.p8),
//         child: Text(
//           message,
//           style: getRegularTextStyle(color: Colors.black),
//         ),
//       ),
//     );
//   }
// }
