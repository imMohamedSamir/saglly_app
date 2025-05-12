import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/ToastificationMethod.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/HomeView/data/models/student_model.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo.dart';
import 'package:hodory/main.dart';
import 'package:meta/meta.dart';

part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  StudentsCubit(this._repo) : super(StudentsInitial());
  final ClassesRepo _repo;
  static StudentsCubit get(context) => BlocProvider.of(context);
  void addStudent({required String name, required String classId}) async {
    StudentModel model = StudentModel(name: name, classId: classId);

    emit(StudentsLoading());
    final result = await _repo.addStudent(model: model);
    result.fold(
      (fail) {
        emit(StudentsFailure());
      },
      (success) {
        Navigator.pop(navigatorKey.currentContext!);
        CustomToastification.successDialog(content: "student has been added !");
        getStudetnts(classId: classId);
      },
    );
  }

  void updateStudent({
    required String name,
    required StudentModel model,
  }) async {
    emit(StudentsLoading());
    final result = await _repo.updateStudent(model: model.copyWith(name: name));
    result.fold(
      (fail) {
        getStudetnts(classId: model.classId ?? "");
      },
      (success) {
        Navigator.pop(navigatorKey.currentContext!);
        getStudetnts(classId: model.classId ?? "");
      },
    );
  }

  void deleteStudent({required StudentModel model}) async {
    emit(StudentsLoading());
    final result = await _repo.deleteStudent(id: model.id ?? "");
    result.fold(
      (fail) {
        getStudetnts(classId: model.classId ?? "");
      },
      (success) {
        Navigator.pop(navigatorKey.currentContext!);
        getStudetnts(classId: model.classId ?? "");
      },
    );
  }

  void getStudetnts({required String classId}) async {
    emit(StudentsLoading());
    final result = await _repo.getStudents(classId: classId);
    result.fold(
      (fail) {
        CustomToastification.errorDialog(content: "Failed to get students");
        emit(StudentsFailure());
      },
      (students) {
        emit(StudentsSuccess(students: students));
      },
    );
  }

  void editClass({required ClassModel model}) async {
    final result = await _repo.updateClass(model: model);
    result.fold(
      (faill) {
        CustomToastification.errorDialog(content: "Failed to update class");
      },
      (success) {
        CustomToastification.successDialog(
          content: "class name has been updated",
        );
      },
    );
  }
}
