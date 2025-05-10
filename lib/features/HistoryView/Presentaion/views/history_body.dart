import 'package:flutter/material.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_analysis_sec.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_filter_sec.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_students_list.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 16,
        children: [
          HistoryFilterSec(),
          HistoryAnalysisSec(),
          HistoryStudentsList(),
        ],
      ),
    );
  }
}
