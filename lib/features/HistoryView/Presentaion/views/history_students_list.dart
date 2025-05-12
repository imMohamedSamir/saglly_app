import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_loading.dart';
import 'package:hodory/features/HistoryView/Presentaion/manager/cubit/history_cubit.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_empty.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_student_card.dart';

class HistoryStudentsList extends StatelessWidget {
  const HistoryStudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return const Expanded(child: ClassStudentLoading());
        } else if (state is HistorySuccess) {
          final attendance = state.history;
          if (attendance.isEmpty) {
            return const HistoryEmpty();
          }
          return Expanded(
            child: ListView.builder(
              itemCount: attendance.length,
              itemBuilder: (BuildContext context, int index) {
                return HistoryStudentCard(model: attendance[index]);
              },
            ),
          );
        } else {
          return const HistoryEmpty();
        }
      },
    );
  }
}
