import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/core/utlis/Date_Formater.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_analysis.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({
    super.key,
    required this.name,
    required this.studentCount,
  });
  final String name;
  final int studentCount;
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
                DateFormater.fromatDate(
                  value: DateTime.now().toIso8601String(),
                ),
                style: AppTextStyles.regular12.copyWith(
                  color: ColorManager.lightText,
                  fontSize: 16,
                ),
              ),
              Text(name, style: AppTextStyles.regular10.copyWith(fontSize: 16)),
            ],
          ),
        ),
        const Gap(8),
        const Divider(height: 16),
        AttendanceAnalysis(studentCount: studentCount),
      ],
    );
  }
}
