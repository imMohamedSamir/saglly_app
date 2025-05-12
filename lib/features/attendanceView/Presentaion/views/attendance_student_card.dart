import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/HomeView/data/models/student_model.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_card_options.dart';

class AttendanceStudentCard extends StatelessWidget {
  const AttendanceStudentCard({super.key, required this.model});
  final StudentModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 50.h,
          width: 50.h,
          decoration: const BoxDecoration(
            color: ColorManager.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              _getName(name: model.name ?? ""),
              style: AppTextStyles.medium18.copyWith(color: Colors.white),
            ),
          ),
        ),
        title: Text(
          model.name ?? "",
          style: AppTextStyles.medium16.copyWith(color: ColorManager.lightText),
        ),

        trailing: AttendanceCardOptions(studetnId: model.id ?? ""),
      ),
    );
  }

  String _getName({required String name}) {
    List<String> words = name.trim().split(' ');

    String initials = words.map((word) => word[0]).join();
    return initials;
  }
}
