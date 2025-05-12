import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/ClassView/Presentaion/manager/students_cubit/students_cubit.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo_impl.dart';
import 'package:hodory/features/attendanceView/Presentaion/manager/attendance_cubit/attendance_cubit.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_body.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_submitt_btn.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo_impl.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key, required this.model});
  final ClassModel model;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AttendanceCubit(
                model.id ?? "",
                getIt.get<AttendanceRepoImpl>(),
              ),
        ),
        BlocProvider(
          create:
              (context) =>
                  StudentsCubit(getIt.get<ClassesRepoImpl>())
                    ..getStudetnts(classId: model.id ?? ""),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppbar.normal(title: "Take Attendance"),
        body: AttendanceBody(model: model),
        bottomNavigationBar: const AttendanceSubmittBtn(),
      ),
    );
  }
}
