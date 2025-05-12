import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hodory/core/theming/color_manager.dart';
import 'package:hodory/core/theming/text_styles.dart';
import 'package:hodory/features/ClassView/Presentaion/manager/students_cubit/students_cubit.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_loading.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_students_empty.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_students_list.dart';

class ClassStudentsSec extends StatelessWidget {
  const ClassStudentsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCubit, StudentsState>(
      builder: (context, state) {
        if (state is StudentsLoading) {
          return const ClassStudentLoading();
        } else if (state is StudentsSuccess) {
          final students = state.students;
          if (students.isEmpty) {
            return const ClassStudentsEmpty();
          }
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Students (${students.length})",
                  style: AppTextStyles.regular12.copyWith(
                    fontSize: 16,
                    color: ColorManager.lightText,
                  ),
                ),
                Text(
                  "Drag to left to edit student details",
                  style: AppTextStyles.regular12.copyWith(fontSize: 14),
                ),
                const Gap(8),
                ClassStudentsList(students: students),
              ],
            ),
          );
        } else {
          return const Center(child: Text("No Data"));
        }
      },
    );
  }
}
