import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';
import 'package:ieee_app/view/Tasker%20screen/home%20screen/view/home_view.dart';

class BottomNavigationSheetValueTasker extends StatefulWidget {
  const BottomNavigationSheetValueTasker({super.key});

  @override
  State<BottomNavigationSheetValueTasker> createState() =>
      _BottomNavigationSheetValueTaskerState();
}

class _BottomNavigationSheetValueTaskerState
    extends State<BottomNavigationSheetValueTasker> {
  int curentIndex = 0;

  void changeIndex(index) {
    setState(() {
      curentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColorOfWhite,
      appBar: _customeAppBar(),
      body: _listBody[curentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  // body list will change from bottom value to anthor
  final List<Widget> _listBody = [
    const HomeTasker(),
    const NotificationScreen(),
    const LocalProfileData(),
    const ChatScreen(),
  ];

  // bottomNavigationBar list
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (newValue) => changeIndex(newValue),
      currentIndex: curentIndex,
      selectedItemColor: ColorManager.primaryColorGreen,
      unselectedItemColor: ColorManager.primaryColorBlack,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedLabelStyle: const TextStyle(
        color: ColorManager.primaryColorBlack,
      ),
      elevation: 0,
      items: <BottomNavigationBarItem>[
        _bottomNavigtionBarItem(
          labelValue: "Home",
          iconValue: const Icon(Icons.home_filled),
        ),
        _bottomNavigtionBarItem(
          labelValue: "Notofication",
          iconValue: const Icon(
            Icons.notifications_outlined,
          ),
        ),
        _bottomNavigtionBarItem(
          labelValue: "Profile",
          iconValue: const Icon(
            Icons.person_2_outlined,
          ),
        ),
        _bottomNavigtionBarItem(
          labelValue: "Chat",
          iconValue: const Icon(
            Icons.chat,
          ),
        ),
      ],
    );
  }

  // bottomNavigationBar value will put inside the list
  BottomNavigationBarItem _bottomNavigtionBarItem({
    required String labelValue,
    required Icon iconValue,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: ColorManager.primaryColorOfWhite,
      label: labelValue,
      activeIcon: iconValue,
      icon: iconValue,
    );
  }

  AppBar _customeAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorManager.primaryColorOfWhite,
      title: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p20),
        child: IconButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(
            RouteManager.bottomNavigationRouteTasker,
          ),
          icon: const Icon(
            size: FontSize.s32f,
            Icons.home,
            color: ColorManager.primaryColorGreen,
          ),
        ),
      ),
      actions: [
        Padding(
          padding:
              const EdgeInsets.only(top: AppPadding.p20, right: AppPadding.p14),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  size: FontSize.s32f,
                  color: ColorManager.primaryColorBlack,
                  Icons.notifications_none_rounded,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p8),
                child: SizedBox(
                  height: AppPadding.p70,
                  width: AppPadding.p40,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      ImageAssetesPath.profileImage,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(ImageAssetesPath.lock));
  }
}

class LocalProfileData extends StatelessWidget {
  const LocalProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(
            left: AppSize.s60,
            right: AppSize.s60,
            top: AppSize.s16,
            bottom: AppSize.s16),
        backgroundColor: ColorManager.primaryColorGreen,
      ),
      onPressed: () {
        try {
          FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacementNamed(RouteManager.roleRoute);
        } catch (e) {
          rethrow;
        }
      },
      child: const Text(
        StringConsant.signOUt,
        style: TextStyle(
          fontFamily: FontConstants.fontfamily,
          fontWeight: FontWeight.w700,
          fontSize: FontSize.s20f,
        ),
      ),
    ));
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(ImageAssetesPath.lock));
  }
}
