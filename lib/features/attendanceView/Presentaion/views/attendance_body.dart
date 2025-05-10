import 'package:flutter/material.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_header.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_students_list.dart';

class AttendanceBody extends StatelessWidget {
  const AttendanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: AttendanceHeader()),
        SliverToBoxAdapter(child: Divider(height: 26)),
        AttendanceStudentsList(),
      ],
    );
  }
}
