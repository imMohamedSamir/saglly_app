import 'package:flutter/material.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_body.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_submitt_btn.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.normal(title: "Take Attendance"),
      body: const AttendanceBody(),
      bottomNavigationBar: const AttendanceSubmittBtn(),
    );
  }
}
