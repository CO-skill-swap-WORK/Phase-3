// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

class SliderViewObject {
  OnBoardingModel onBoarding;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.onBoarding,
    required this.numOfSlides,
    required this.currentIndex,
  });
}

class CreateNewUserModel {
  String name;
  String email;
  String password;
  String nationalId;
  String userType;
  CreateNewUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.nationalId,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "Name": name,
      "Email": email,
      "Password": password,
      "NationalId": nationalId,
      "UserType": userType,
    };
  }

  factory CreateNewUserModel.fromJson(Map<String, dynamic> json) {
    return CreateNewUserModel(
      userType: json['UserType'],
      name: json['Name'] as String,
      email: json['Email'] as String,
      password: json['Password'] as String,
      nationalId: json['NationalId'] as String,
    );
  }
}

class CreatePostModel {
  String userName;
  String title;
  String location;
  String description;
  String userIdAuthentication;
  CreatePostModel({
    required this.title,
    required this.description,
    required this.location,
    required this.userIdAuthentication,
    required this.userName,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'JobTitle': title,
      'JobLocation': location,
      'JobDescription': description,
      'UserId': userIdAuthentication,
      'UserName': userName,
    };
  }

  factory CreatePostModel.fromJson(Map<String, dynamic> map) {
    return CreatePostModel(
      title: map['JobTitle'] as String,
      location: map['JobLocation'] as String,
      description: map['JobDescription'] as String,
      userIdAuthentication: map['UserId'] as String,
      userName:map["UserName"] as String
    );
  }
}

class GetPostsForCustomerHome {
  String jobTitle;
  String jobDescription;
  String jobLocation;

  GetPostsForCustomerHome({
    required this.jobTitle,
    required this.jobDescription,
    required this.jobLocation,
  });

  Map<String, dynamic> toJson() {
    return {
      "JobTitle": jobTitle,
      "JobDescription": jobDescription,
      "JobLocation": jobLocation,
    };
  }

  factory GetPostsForCustomerHome.fromJson(
      DocumentSnapshot<Map<String, dynamic>> json) {
    return GetPostsForCustomerHome(
      jobTitle: json["JobTitle"] as String,
      jobDescription: json["JobDescription"] as String,
      jobLocation: json["JobLocation"] as String,
    );
  }
}

class SliderOFPosts {
  GetPostsForCustomerHome getPostsForCustomerHome;
  int len;
  SliderOFPosts({required this.getPostsForCustomerHome, required this.len});
}
