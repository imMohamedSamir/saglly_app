import 'package:dartz/dartz.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/HomeView/data/models/student_model.dart';

abstract class ClassesRepo {
  Future<Either<String, List<ClassModel>>> getClasses({String? name});
  Future<Either<String, dynamic>> addClass({required ClassModel model});
  Future<Either<String, dynamic>> updateClass({required ClassModel model});
  Future<Either<String, dynamic>> addStudent({required StudentModel model});
  Future<Either<String, List<StudentModel>>> getStudents({
    required String classId,
  });
  Future<Either<String, dynamic>> updateStudent({required StudentModel model});

  Future<Either<String, dynamic>> deleteStudent({required String id});
  Future<Either<String, dynamic>> deleteClass({required String id});
}
