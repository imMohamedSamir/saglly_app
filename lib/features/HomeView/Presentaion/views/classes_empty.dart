import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';

class ClassesEmpty extends StatelessWidget {
  const ClassesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        spacing: 8,
        children: [
          const Gap(100),
          Container(
            height: 110.h,
            width: 110.h,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorManager.primary.withValues(alpha: .2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.school_outlined,
              color: ColorManager.primary,
              size: 65.sp,
            ),
          ),
          Text(
            "No classes yet",
            style: AppTextStyles.semiBold18.copyWith(
              color: ColorManager.lightText,
              fontSize: 22,
            ),
          ),
          Text(
            "Start your teaching journey by adding your first class",
            style: AppTextStyles.medium16.copyWith(color: ColorManager.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
