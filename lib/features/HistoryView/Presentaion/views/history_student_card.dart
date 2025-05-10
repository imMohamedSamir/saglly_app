import 'package:flutter/material.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_card_options.dart';

class HistoryStudentCard extends StatelessWidget {
  const HistoryStudentCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              _getName(name: "Alice Johnson"),
              style: AppTextStyles.medium18.copyWith(color: Colors.white),
            ),
          ),
        ),
        title: Text(
          'Alice Johnson',
          style: AppTextStyles.medium16.copyWith(color: ColorManager.lightText),
        ),

        trailing: const AttendanceCardOptions(),
      ),
    );
  }

  String _getName({required String name}) {
    List<String> words = name.trim().split(' ');

    String initials = words.map((word) => word[0]).join();
    return initials;
  }
}
