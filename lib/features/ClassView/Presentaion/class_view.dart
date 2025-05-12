import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/core/widgets/custom_appbar.dart';
import 'package:hodory/features/ClassView/Presentaion/manager/students_cubit/students_cubit.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_add_student_btn.dart';
import 'package:hodory/features/ClassView/Presentaion/views/class_body.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo_impl.dart';

class ClassView extends StatelessWidget {
  const ClassView({super.key, required this.model});
  final ClassModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              StudentsCubit(getIt.get<ClassesRepoImpl>())
                ..getStudetnts(classId: model.id ?? ""),
      child: Scaffold(
        appBar: CustomAppbar.normal(title: "Class details"),
        body: ClassBody(model: model),
        bottomNavigationBar: ClassAddStudentBtn(classId: model.id ?? ""),
      ),
    );
  }
}
