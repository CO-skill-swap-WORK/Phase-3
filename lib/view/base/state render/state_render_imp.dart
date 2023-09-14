import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/view/base/state%20render/state_render_file.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

// this is connected with ui and stateRenderer
// flow state for loading state (popup , full screen)

class LoadingStateImp extends FlowState {
  StateRendererType stateRendererType;
  String message;
  LoadingStateImp(
      {this.message = StringConsant.loadingState,
      required this.stateRendererType});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorStateImp extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorStateImp({required this.stateRendererType, required this.message});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// this is content state used for show content view in login (logo , button , inputTextFiled) in home(show data in home image or anything)
class ContentStateImp extends FlowState {
  ContentStateImp();

  @override
  String getMessage() => StringConsant.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

class SuccessStateImp extends FlowState {
  SuccessStateImp();

  @override
  String getMessage() => StringConsant.success;

  @override
  StateRendererType getStateRendererType() => StateRendererType.success;
}

// Empty State
class EmptyStateImp extends FlowState {
  String message;

  EmptyStateImp({required this.message});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

extension ExtensionFlowState on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingStateImp:
        {
          if (getStateRendererType() == StateRendererType.popupLodingState) {
            // show popup loading
            showPopup(context, getStateRendererType(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen loading state
            return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRendererType(),
              retryActionFunction: retryActionFunction,
            );
          }
        }

      case ErrorStateImp:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // show popup error
            showPopup(context, getStateRendererType(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen loading state
            return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRendererType(),
              retryActionFunction: retryActionFunction,
            );
          }
        }

      case EmptyStateImp:
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            retryActionFunction: () {},
            message: getMessage(),
          );
        }

      case SuccessStateImp:
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            retryActionFunction: () {},
            message: getMessage(),
          );
        }

      case ContentStateImp:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }

      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  showPopup(BuildContext context, StateRendererType stateRendererType,
      String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
          stateRendererType: stateRendererType,
          retryActionFunction: () {},
          message: message,
        ),
      );
    });
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }
}
