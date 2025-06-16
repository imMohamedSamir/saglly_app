import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/features/ClassView/Presentaion/manager/students_cubit/students_cubit.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_loading.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_students_empty.dart';
import 'package:hodory/features/attendanceView/Presentaion/views/attendance_student_card.dart';

class AttendanceStudentsList extends StatelessWidget {
  const AttendanceStudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: BlocBuilder<StudentsCubit, StudentsState>(
        builder: (context, state) {
          if (state is StudentsLoading) {
            return const SliverToBoxAdapter(child: ClassStudentLoading());
          } else if (state is StudentsSuccess) {
            final studetns = state.students;
            if (studetns.isEmpty) {
              return const SliverToBoxAdapter(child: ClassStudentsEmpty());
            }
            return SliverList.builder(
              itemCount: studetns.length,
              itemBuilder: (context, index) {
                return AttendanceStudentCard(model: studetns[index]);
              },
            );
          } else {
            return const SliverToBoxAdapter(child: Center(child: SizedBox()));
          }
        },
      ),
    );
  }
}
