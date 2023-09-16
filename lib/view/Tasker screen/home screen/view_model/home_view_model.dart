import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ieee_app/domain/models/base_models.dart';
import 'package:ieee_app/view/base/baseviewmodel.dart';
import 'package:ieee_app/view/base/state%20render/state_render_imp.dart';

class HomeViewModelTasker extends BasedViewModel
    implements HomeViewModelInput, HomeViewModelOutput {
  final _streamListOfData =
      StreamController<GetPostsForCustomerHome>.broadcast();
  late List<GetPostsForCustomerHome> _list;

  @override
  void start() {
    // _list = getDataFromFirebase();
    inputState.add(ContentStateImp());
  }

  @override
  void dispose() {
    _streamListOfData.close();
    super.dispose();
  }

  //private function
  getDataFromFirebase() {
    final curentUserId = FirebaseAuth.instance.currentUser!.uid;
    final instance = FirebaseFirestore.instance;
    final userData = instance.collection('posts').snapshots();
    userData.forEach(
      (snapShoteData) {
        for (var doc in snapShoteData.docs) {
          if (doc['UserId'] == curentUserId) {
            _list.add(
              GetPostsForCustomerHome.fromJson(doc),
            );
          }
        }
      },
    );
    // print(_list.length);
  }
}

mixin HomeViewModelInput {}

mixin HomeViewModelOutput {}
