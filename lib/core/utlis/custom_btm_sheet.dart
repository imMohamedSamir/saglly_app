import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_student_btm_sheet.dart';
import 'package:hodory/features/HomeView/Presentaion/manager/class_cubit/class_cubit.dart';
import 'package:hodory/features/HomeView/Presentaion/views/add_class_btm_sheet.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo_impl.dart';
import 'package:hodory/main.dart';

final context = navigatorKey.currentContext!;

abstract class CustomBtmsheet {
  static void addClass({required Function() onExit}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => ClassCubit(getIt.get<ClassesRepoImpl>()),
          child: AddClassBtmSheet(onExit: onExit),
        );
      },
    );
  }

  static void addStudent({
    required void Function(String) onSubmit,
    String? name,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ClassStudentBtmSheet(onSubmit: onSubmit, name: name);
      },
    );
  }
}
