import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app/app/resourse/app_padding.dart';
import 'package:ieee_app/app/resourse/app_sizes.dart';
import 'package:ieee_app/app/resourse/assets_manager.dart';
import 'package:ieee_app/app/resourse/color_manager.dart';

class HomeTasker extends StatefulWidget {
  const HomeTasker({super.key});

  @override
  State<HomeTasker> createState() => _HomeTaskerState();
}

class _HomeTaskerState extends State<HomeTasker> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("posts").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final clients = snapshot.data?.docs.reversed.toList();
            return Column(
              children: [
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
          } else {
            return Container(
              child: const Text("Not Data"),
            );
          }
        });
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
                border: Border.all(color: ColorManager.primaryColorGreen),
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
}
