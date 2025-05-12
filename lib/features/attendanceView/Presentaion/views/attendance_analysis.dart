import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/attendanceView/Presentaion/manager/attendance_cubit/attendance_cubit.dart';
import 'package:hodory/features/attendanceView/Presentaion/manager/attendance_cubit/attendance_state.dart';
import 'package:hodory/features/attendanceView/data/models/header_analysis_model.dart';

class AttendanceAnalysis extends StatelessWidget {
  const AttendanceAnalysis({super.key, required this.studentCount});
  final int studentCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<AttendanceCubit, AttendanceState>(
        builder: (context, state) {
          final List<HeaderAnalysisModel> options = [
            HeaderAnalysisModel(
              title: 'Students',
              count: studentCount,
              icon: const Icon(Icons.school),
            ),
            HeaderAnalysisModel(
              title: 'Present',
              count: state.totalPresent,
              icon: const Icon(Icons.check_circle, color: Colors.green),
            ),
            HeaderAnalysisModel(
              title: 'Absent',
              count: state.totalAbsent,
              icon: const Icon(Icons.close_rounded, color: Colors.red),
            ),
          ];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children:
                options.map((title) {
                  return Expanded(
                    child: Card(
                      color: Colors.white,
                      elevation: .7,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            title.icon,
                            Text(
                              title.count.toString(),

                              style: AppTextStyles.medium16.copyWith(
                                color: ColorManager.lightText,
                              ),
                            ),
                            Text(
                              title.title.toString(),

                              style: AppTextStyles.regular12.copyWith(
                                color: ColorManager.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
