import 'package:equatable/equatable.dart';
import 'package:hodory/features/HomeView/data/models/student_model.dart';

class AttendanceState extends Equatable {
  final bool studetnsLoading;
  final bool isAddLoading;
  final List<StudentModel>? students;
  final String? error;
  final int totalStudents;
  final int totalPresent;
  final int totalAbsent;
  const AttendanceState({
    this.studetnsLoading = false,
    this.isAddLoading = false,
    this.students,
    this.error,
    this.totalStudents = 0,
    this.totalPresent = 0,
    this.totalAbsent = 0,
  });
  AttendanceState copyWith({
    bool? studetnsLoading,
    bool? isAddLoading,
    List<StudentModel>? students,
    String? error,
    int? totalStudents,
    int? totalPresent,
    int? totalAbsent,
  }) {
    return AttendanceState(
      studetnsLoading: studetnsLoading ?? false,
      isAddLoading: isAddLoading ?? false,
      students: students ?? this.students,
      error: error,
      totalStudents: totalStudents ?? this.totalStudents,
      totalPresent: totalPresent ?? this.totalPresent,
      totalAbsent: totalAbsent ?? this.totalAbsent,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    studetnsLoading,
    isAddLoading,
    students,
    error,
    totalStudents,
    totalPresent,
    totalAbsent,
  ];
}
