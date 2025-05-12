import 'package:flutter/material.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_header.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_students_list.dart';

class AttendanceBody extends StatelessWidget {
  const AttendanceBody({super.key, required this.model});
  final ClassModel model;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: AttendanceHeader(
            name: model.name ?? "",
            studentCount: model.studentNo ?? 0,
          ),
        ),
        const SliverToBoxAdapter(child: Divider(height: 26)),
        const AttendanceStudentsList(),
      ],
    );
  }
}
