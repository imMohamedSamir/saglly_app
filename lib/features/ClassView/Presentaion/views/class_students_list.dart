import 'package:flutter/material.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_card.dart';

class ClassStudentsList extends StatelessWidget {
  const ClassStudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const ClassStudentCard();
        },
      ),
    );
  }
}
