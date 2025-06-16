import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo_impl.dart';
import 'package:hodory/features/ReportsView/Presentaion/manager/cubit/report_cubit.dart';
import 'package:hodory/features/ReportsView/Presentaion/views/reports_body.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo_impl.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReportCubit(getIt.get<AttendanceRepoImpl>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  ClassCubit(getIt.get<ClassesRepoImpl>())..getClasses(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppbar.home(title: "Attendance Reports"),
        body: const ReportsBody(),
      ),
    );
  }
}
