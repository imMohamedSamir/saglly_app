import 'package:flutter/material.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_delete.dart';
import 'package:hodory/features/HomeView/Presentaion/views/class_delete_dialog.dart';
import 'package:hodory/features/profileView/Presentaion/views/logout_msg.dart';
import 'package:hodory/main.dart';

final context = navigatorKey.currentContext!;

class CustomDialog {
  static void logoutMsg({void Function()? onPressed}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(child: LogoutMsg(onPressed: onPressed));
      },
    );
  }

  static void deleteStudent({
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

  static void deleteClass({
    required String name,
    required void Function()? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ClassDeleteDialog(name: name, onPressed: onPressed),
        );
      },
    );
  }
}
