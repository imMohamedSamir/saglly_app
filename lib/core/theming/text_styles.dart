import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';
import 'size_config.dart';

abstract class AppTextStyles {
  static TextStyle get regular10 => TextStyle(
    color: ColorManager.grey,
    fontSize: 10.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle get regular12 => TextStyle(
    color: ColorManager.grey,
    fontSize: 12.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle get medium16 => TextStyle(
    color: ColorManager.grey,
    fontSize: 16.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle get medium18 => TextStyle(
    color: ColorManager.lightText,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle get medium20 => TextStyle(
    color: ColorManager.primary,
    fontSize: 20.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle get medium24 => TextStyle(
    color: ColorManager.primary,
    fontSize: 24.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle get bold18 => TextStyle(
    color: ColorManager.primary,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );

  static TextStyle get bold16 => TextStyle(
    color: ColorManager.primary,
    fontSize: 16.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );

  static TextStyle get semiBold16 => TextStyle(
    color: ColorManager.primary,
    fontSize: 16.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle get semiBold18 => TextStyle(
    color: ColorManager.primary,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  // print("width = $width");
  if (width < SizeConfig.tablet) {
    return width / 400;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
