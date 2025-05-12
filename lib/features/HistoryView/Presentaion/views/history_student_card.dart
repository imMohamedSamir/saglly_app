import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_attendance_options.dart';
import 'package:hodory/features/attendanceView/data/models/attendance_model.dart';

class HistoryStudentCard extends StatelessWidget {
  const HistoryStudentCard({super.key, required this.model});
  final AttendanceModel model;
  @override
  Widget build(BuildContext context) {
    final name = model.studentName ?? "";
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        leading: ClipOval(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(color: ColorManager.primary),
            child: Text(
              _getName(name: name),
              style: AppTextStyles.medium18.copyWith(color: Colors.white),
            ),
          ),
        ),
        title: Text(
          name,
          style: AppTextStyles.medium16.copyWith(color: ColorManager.lightText),
        ),

        trailing: HistoryAttendanceOptions(
          studetnId: model.studentId ?? "",
          initialValue: model.status,
        ),
      ),
    );
  }

  String _getName({required String name}) {
    List<String> words = name.trim().split(' ');

    String initials = words.map((word) => word[0]).join();
    return initials;
  }
}
