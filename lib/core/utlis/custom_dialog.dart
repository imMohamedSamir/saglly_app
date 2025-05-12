import 'package:flutter/material.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_delete.dart';
import 'package:hodory/main.dart';

final context = navigatorKey.currentContext!;

class CustomDialog {
  static void deleteStudetn({
    required String name,
    required void Function()? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ClassStudentDelete(name: name, onPressed: onPressed),
        );
      },
    );
  }
}
