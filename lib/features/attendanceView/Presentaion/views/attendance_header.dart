import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_analysis.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              Text(
                "Friday, May 9, 2025",
                style: AppTextStyles.regular12.copyWith(
                  color: ColorManager.lightText,
                  fontSize: 16,
                ),
              ),
              Text(
                "Mathematics - Class 10A",
                style: AppTextStyles.regular10.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        const Gap(8),
        const Divider(height: 16),
        const AttendanceAnalysis(),
      ],
    );
  }
}
