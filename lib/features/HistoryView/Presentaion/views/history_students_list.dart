import 'package:flutter/material.dart';
import 'package:hodory/features/HistoryView/Presentaion/views/history_student_card.dart';

class HistoryStudentsList extends StatelessWidget {
  const HistoryStudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const HistoryStudentCard();
        },
      ),
    );
  }
}
