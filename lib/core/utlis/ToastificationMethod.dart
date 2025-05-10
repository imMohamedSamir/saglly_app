import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../theming/text_styles.dart';

abstract class CustomToastification {
  static void errorDialog({required String content}) {
    toastification.show(
      type: ToastificationType.error,
      showProgressBar: false,
      pauseOnHover: true,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      description: Text(
        content,
        style: AppTextStyles.bold18.copyWith(color: Colors.white),
      ),
    );
  }

  static void successDialog({required String content}) {
    toastification.show(
      type: ToastificationType.success,
      showProgressBar: false,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      description: Text(
        content,
        style: AppTextStyles.bold18.copyWith(color: Colors.white),
      ),
    );
  }

  static void warningDialog({required String content}) {
    toastification.show(
      type: ToastificationType.warning,
      showProgressBar: false,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: Colors.yellow,
      description: Text(
        content,
        style: AppTextStyles.bold18.copyWith(color: Colors.white),
      ),
    );
  }
}
