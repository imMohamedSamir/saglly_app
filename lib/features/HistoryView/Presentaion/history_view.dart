import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/HistoryView/Presentaion/manager/cubit/history_cubit.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_body.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo_impl.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo_impl.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HistoryCubit(getIt.get<AttendanceRepoImpl>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  ClassCubit(getIt.get<ClassesRepoImpl>())..getClasses(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppbar.home(title: "Attendance History"),
        body: const HistoryBody(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
