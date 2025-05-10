import 'package:flutter/material.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_add_student_btn.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_body.dart';

class ClassView extends StatelessWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.normal(title: "Class details"),
      body: const ClassBody(),
      bottomNavigationBar: const ClassAddStudentBtn(),
    );
  }
}
