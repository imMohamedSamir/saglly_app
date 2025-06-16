import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hodory/core/utlis/Constatnts.dart';
import 'package:hodory/core/utlis/Supabase_services.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/HomeView/data/models/student_model.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassesRepoImpl implements ClassesRepo {
  final SupabaseServices _services;
  final SharedPreferences _pref;

  ClassesRepoImpl({
    required SupabaseServices services,
    required SharedPreferences pref,
  }) : _services = services,
       _pref = pref;
  @override
  Future<Either<String, List<ClassModel>>> getClasses({String? name}) async {
    final userId = _pref.getString(AppConstatnts.userId);

    try {
      final fliter =
          name != null
              ? {'class_name': "%$name%", "teacher_id": userId}
              : {"teacher_id": userId};
      final response = await _services.get(
        table: AppConstatnts.classesStudentsCount,
        filters: fliter,
      );
      List<ClassModel> classes = [];
      for (var element in response) {
        classes.add(ClassModel.fromJson(element));
      }
      return right(classes);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> addClass({required ClassModel model}) async {
    try {
      final userId = _pref.getString(AppConstatnts.userId);
      final response = await _services.insert(
        table: AppConstatnts.classes,
        values: model.toJson(),
      );
      final response2 = await _services.insert(
        table: AppConstatnts.assignClass,
        values: {'class_id': response['id'], 'teacher_id': userId},
      );
      return right(response2);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> addStudent({
    required StudentModel model,
  }) async {
    try {
      final response = await _services.insert(
        table: AppConstatnts.students,
        values: model.toJson(),
      );
      log(response.toString());

      return right(response);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, List<StudentModel>>> getStudents({
    required String classId,
  }) async {
    try {
      final response = await _services.get(
        table: AppConstatnts.attendanceSummary,
        filters: {"class_id": classId},
      );
      List<StudentModel> students = [];
      for (var element in response) {
        students.add(StudentModel.fromJson(element));
      }
      return right(students);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> deleteStudent({required String id}) async {
    try {
      await _services.delete(table: AppConstatnts.students, id: id);

      return right("deleted");
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> updateStudent({
    required StudentModel model,
  }) async {
    try {
      final response = await _services.update(
        table: AppConstatnts.students,
        values: model.toJson(),
        id: model.id ?? "",
      );
      log(response.toString());

      return right(response);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> updateClass({
    required ClassModel model,
  }) async {
    try {
      final response = await _services.update(
        table: AppConstatnts.classes,
        values: model.toJson(),
        id: model.id ?? "",
      );
      log(response.toString());

      return right(response);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> deleteClass({required String id}) async {
    try {
      await _services.delete(
        table: AppConstatnts.assignClass,
        id: id,
        idField: "class_id",
      );
      await _services.delete(table: AppConstatnts.classes, id: id);

      return right("deleted");
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }
}
