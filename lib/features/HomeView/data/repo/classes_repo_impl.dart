import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hodory/core/utlis/Constatnts.dart';
import 'package:hodory/core/utlis/Supabase_services.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/HomeView/data/models/student_model.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo.dart';

class ClassesRepoImpl implements ClassesRepo {
  final SupabaseServices _services;

  ClassesRepoImpl({required SupabaseServices services}) : _services = services;
  @override
  Future<Either<String, List<ClassModel>>> getClasses({String? name}) async {
    try {
      final fliter = name != null ? {'class_name': "%$name%"} : null;
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
      final response = await _services.insert(
        table: AppConstatnts.classes,
        values: model.toJson(),
        // filters: {"name": name ?? ""},
        // foreignTables: 'student_class(students(*))',
      );

      return right(response);
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
}
