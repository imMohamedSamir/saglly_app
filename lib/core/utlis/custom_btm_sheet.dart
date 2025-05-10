import 'package:flutter/material.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_btm_sheet.dart';
import 'package:hodory/features/HomeView/Presentaion/views/add_class_btm_sheet.dart';
import 'package:hodory/main.dart';

final context = navigatorKey.currentContext!;

abstract class CustomBtmsheet {
  static void addClass() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const AddClassBtmSheet();
      },
    );
  }

  static void addStudent() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const ClassStudentBtmSheet();
      },
    );
  }
}
