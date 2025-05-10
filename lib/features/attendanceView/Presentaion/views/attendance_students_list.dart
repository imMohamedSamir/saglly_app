import 'package:flutter/material.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_student_card.dart';

class AttendanceStudentsList extends StatelessWidget {
  const AttendanceStudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const AttendanceStudentCard();
        },
      ),
    );
  }
}
