import 'package:flutter/material.dart';

class Globals {
  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
}

class PageConst {
  static const String loginPage = "/login";
  static const String menuPage = "/menu";
  static const String audioTestPage = "/audio-test";
  static const String dataCollectionPage = "/data-collection";
  static const String registerUser = "/register-user";
  static const String userManagement = "/user-management";
  static const String userDetails = "/user-details";
  static const String profileDetails = "/profile-details";
  static const String editUser = "/edit-user";
  static const String editProfile = "/edit-profile";
  static const String manageFields = "/manage-fields";
  static const String manageGeneralFields = "/manage-general-fields";
  static const String manageRespiratoryFailureFields =
      "/manage-respiratory-failure-fields";
  static const String manageSmokingFields = "/manage-smoking-fields";
}

class StepProgressValue {
  static const double patientData = 0.12;
  static const double lineOfStudy = 0.26;
  static const double ambientNoise = 0.50;
  static const double sustentainedVowel = 0.63;
  static const double phrase = 0.76;
  static const double rhyme = 0.89;
  static const double submitData = 1.00;
}
