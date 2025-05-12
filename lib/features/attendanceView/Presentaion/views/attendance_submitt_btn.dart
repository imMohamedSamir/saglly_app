import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/widgets/customButton.dart';
import 'package:hodory/features/attendanceView/Presentaion/manager/attendance_cubit/attendance_cubit.dart';
import 'package:hodory/features/attendanceView/Presentaion/manager/attendance_cubit/attendance_state.dart';

class AttendanceSubmittBtn extends StatelessWidget {
  const AttendanceSubmittBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: BlocBuilder<AttendanceCubit, AttendanceState>(
        builder: (context, state) {
          return CustomButton(
            text: "Submit Attendance",
            txtcolor: Colors.white,
            btncolor: ColorManager.primary,
            isLoading: state.isAddLoading,
            onPressed: () {
              AttendanceCubit.get(context).submit();
            },
          );
        },
      ),
    );
  }
}
