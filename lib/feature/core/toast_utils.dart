import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spira/feature/core/app_colors.dart';

class ToastUtils {
  static void showAlertToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.red500,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.blue500,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showMicrophonePermissionDeniedToast() {
    showAlertToast("Permissão de microfone negada");
  }

  static void showMicrophonePermissionDeniedPermanentlyToast() {
    showAlertToast("Permissão de microfone negada permanentemente");
  }

  static void showMicrophonePermissionIsNecessary() {
    showAlertToast("Permissão de microfone é necessária");
  }

  static void showErrorFetchingCollectionData() {
    showAlertToast("Ocorreu um erro ao buscar informações da coleta");
  }
}
