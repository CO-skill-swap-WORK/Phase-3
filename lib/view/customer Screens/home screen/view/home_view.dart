import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app/app/consepts_string.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';
import 'package:ieee_app/app/resourse/font_values.dart';
import 'package:ieee_app/app/resourse/routes_manager.dart';

class HomeCustomer extends StatefulWidget {
  const HomeCustomer({super.key});

  @override
  State<HomeCustomer> createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser?.uid;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("posts")
            .where("UserId", isEqualTo: currentUser)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              final clients = snapshot.data?.docs.reversed.toList();
              return Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorManager.primaryColorOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        RouteManager.postRoute,
                      );
                    },
                    child: const Text(StringConsant.createnewPost),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: clients!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _card(
                          [
                            clients[index]['JobTitle'],
                            clients[index]['JobDescription'],
                            clients[index]['JobLocation'],
                            clients[index]['UserName'],
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (snapshot.data == null) {
              return _createNewPost(context);
            } else {
              return Container();
            }
          }
        });
  }

  InkWell _createNewPost(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(RouteManager.postRoute);
      },
      child: _bodyOfInkwell(),
    );
  }

  @override
  void dispose() {
    // _viewModel.dispose();
    super.dispose();
  }

  _card(List data) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: AppSize.s150,
              decoration: BoxDecoration(
                color: ColorManager.primaryColorWhite,
                borderRadius: BorderRadius.circular(AppSize.s16),
                border: Border.all(color: ColorManager.primaryColorOrange),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p4, left: AppPadding.p8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(ImageAssetesPath.profileImage),
                        const SizedBox(
                          width: AppPadding.p12,
                        ),
                        Text(data[3]),
                      ],
                    ),
                    const SizedBox(
                      height: AppPadding.p12,
                    ),
                    Text(data[0]),
                    Text(data[1]),
                    Text(data[2]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //ui in home screen
  Center _bodyOfInkwell() {
    return Center(
      child: Container(
        width: AppSize.s350,
        height: AppSize.s150,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primaryColorOrange),
          color: ColorManager.primaryColorWhite,
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),
        child: const Center(
          child: Text(
            StringConsant.postYourJob,
            style: TextStyle(
              fontFamily: FontConstants.fontfamily,
              fontSize: FontSize.s20f,
              color: ColorManager.primaryColorOrange,
            ),
          ),
        ),
      ),
    );
  }
}
