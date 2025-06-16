import 'package:flutter/material.dart';
import 'package:hodory/main.dart';

import '../theming/color_manager.dart';
import '../theming/text_styles.dart';

class CustomAppbar {
  static AppBar normal({required String title}) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(navigatorKey.currentContext!);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(
        title,
        style: AppTextStyles.semiBold18.copyWith(
          color: ColorManager.lightText,
          fontSize: 20,
        ),
      ),
    );
  }

  static AppBar home({required String title}) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyles.semiBold18.copyWith(
          color: ColorManager.primary,
          fontSize: 22,
        ),
      ),
    );
  }

  static AppBar dashboard({required String title}) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyles.semiBold18.copyWith(
          color: ColorManager.secondary,
          fontSize: 26,
        ),
      ),
    );
  }
}
