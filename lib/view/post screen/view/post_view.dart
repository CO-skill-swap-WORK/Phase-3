import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';
import 'package:ieee_app/app/resourse/widgets/input_filed.dart';
import 'package:ieee_app/view/base/state%20render/state_render_imp.dart';
import 'package:ieee_app/view/post%20screen/view_model/post_view_model.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final _viewModel = CreatePostViewModel();
  final _titleJobController = TextEditingController();
  final _descriptionJobController = TextEditingController();
  final _locationJobController = TextEditingController();
  final _userNameController = TextEditingController();

  _bind() {
    _viewModel.ifDataEnteredTrue.stream.listen((dataValid) {
      if (dataValid) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context)
              .pushReplacementNamed(RouteManager.bottomNavigationRouteCustomer);
        });
      }
    });

    _titleJobController.addListener(() {
      _viewModel.setTitleJob(titleJob: _titleJobController.text);
    });

    _descriptionJobController.addListener(() {
      _viewModel.setDescriptionJob(
          descriptionJob: _descriptionJobController.text);
    });

    _locationJobController.addListener(() {
      _viewModel.setLocationJob(locationJob: _locationJobController.text);
    });

    _userNameController.addListener(() {
      _viewModel.setUserName(
        customerUserName: _userNameController.text,
      );
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColorOfWhite,
      appBar: _appBar(),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outPutState,
        builder: (BuildContext context, snapshot) {
          return snapshot.data?.getScreenWidget(
                context,
                _body(),
                () {
                  _viewModel.createPost();
                },
              ) ??
              _body();
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorManager.primaryColorOfWhite,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                  RouteManager.bottomNavigationRouteCustomer);
            },
            icon: const Icon(
              color: ColorManager.primaryColorBlack,
              Icons.arrow_back,
              size: FontSize.s28f,
            ),
          ),
          const Text(
            StringConsant.enterDetails,
            style: TextStyle(
              fontFamily: FontConstants.fontfamily,
              fontSize: FontSize.s28f,
              color: ColorManager.primaryColorBlack,
            ),
          )
        ],
      ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            _inputSignUp(
              streamValue: _viewModel.checkUserNameStream,
              controller: _userNameController,
              secureText: false,
              title: StringConsant.userName,
              textError: StringConsant.userName,
            ),
            // job Title
            _inputSignUp(
              streamValue: _viewModel.jobTitleStream,
              controller: _titleJobController,
              secureText: false,
              title: StringConsant.jobTitle,
              textError: StringConsant.jobTitleError,
            ),
            // location
            _inputSignUp(
              streamValue: _viewModel.jobLocationStream,
              controller: _locationJobController,
              secureText: false,
              title: StringConsant.jobLocation,
              textError: StringConsant.jobLocationError,
            ),
            // description
            _inputSignUp(
              streamValue: _viewModel.jobDescriptionStream,
              controller: _descriptionJobController,
              secureText: false,
              title: StringConsant.jobDescription,
              textError: StringConsant.jobDescriptionError,
            ),
            // Done Mission
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p28,
              ),
              child: StreamBuilder<bool>(
                  stream: _viewModel.checkAllValueStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryColorOrange,
                          padding: const EdgeInsets.only(
                              left: AppPadding.p100, right: AppPadding.p100)),
                      onPressed: (snapshot.data ?? false)
                          ? () {
                              _viewModel.createPost();
                            }
                          : null,
                      child: const Text(
                        StringConsant.done,
                        style: TextStyle(
                          fontFamily: FontConstants.fontfamily,
                          fontSize: FontSize.s28f,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Padding _inputSignUp({
    required Stream<bool> streamValue,
    required TextEditingController controller,
    required bool secureText,
    required String title,
    required textError,
  }) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: StreamBuilder<bool>(
        stream: streamValue,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextFiledCustome(
            secureText: secureText,
            inputKeyboardFromUser: TextInputType.visiblePassword,
            title: title,
            controller: controller,
            snapshot: snapshot,
            textError: textError,
          );
        },
      ),
    );
  }
}
