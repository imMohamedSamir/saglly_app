import 'package:flutter/material.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_card.dart';
import 'package:hodory/features/HomeView/data/models/student_model.dart';

class ClassStudentsList extends StatelessWidget {
  const ClassStudentsList({super.key, required this.students});
  final List<StudentModel> students;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          return ClassStudentCard(model: students[index]);
        },
      ),
    );
  }
}
