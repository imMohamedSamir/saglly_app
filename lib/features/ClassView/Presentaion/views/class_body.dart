import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_name_sec.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_students_Sec.dart';

class ClassBody extends StatelessWidget {
  const ClassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ClassNameSec(), Gap(16), ClassStudentsSec()],
      ),
    );
  }
}
