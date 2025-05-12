part of 'students_cubit.dart';

@immutable
sealed class StudentsState {}

final class StudentsInitial extends StudentsState {}

final class StudentsLoading extends StudentsState {}

final class StudentsSuccess extends StudentsState {
  final List<StudentModel> students;

  StudentsSuccess({required this.students});
}

final class StudentsFailure extends StudentsState {}
