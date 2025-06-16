import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_styles.dart';

class ProfileImgSec extends StatelessWidget {
  const ProfileImgSec({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,
      height: 130.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.primary.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name.characters.first,
                style: AppTextStyles.semiBold18.copyWith(
                  fontSize: 60,
                  color: ColorManager.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
