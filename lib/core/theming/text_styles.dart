import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

abstract class AppTextStyles {
  static TextStyle regular10 = TextStyle(
    color: ColorManager.grey,
    fontSize: 10.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular12 = TextStyle(
    color: ColorManager.grey,
    fontSize: 10.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static TextStyle medium16 = TextStyle(
    color: ColorManager.grey,
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium18 = TextStyle(
    color: ColorManager.lightText,
    fontSize: 18.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium20 = TextStyle(
    color: ColorManager.primary,
    fontSize: 20.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium24 = TextStyle(
    color: ColorManager.primary,
    fontSize: 24.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle bold18 = TextStyle(
    color: ColorManager.primary,
    fontSize: 18.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold16 = TextStyle(
    color: ColorManager.primary,
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
  );
  static TextStyle semiBold16 = TextStyle(
    color: ColorManager.primary,
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold18 = TextStyle(
    color: ColorManager.primary,
    fontSize: 18.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
}
