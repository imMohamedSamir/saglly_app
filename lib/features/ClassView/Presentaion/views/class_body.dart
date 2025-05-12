import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_name_sec.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_students_Sec.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';

class ClassBody extends StatelessWidget {
  const ClassBody({super.key, required this.model});
  final ClassModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClassNameSec(model: model),
          const Gap(16),
          const ClassStudentsSec(),
        ],
      ),
    );
  }
}
