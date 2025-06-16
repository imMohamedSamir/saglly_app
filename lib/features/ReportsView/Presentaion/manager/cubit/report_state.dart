part of 'report_cubit.dart';

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}

final class ReportLoading extends ReportState {}

final class ReportSuccess extends ReportState {
  final int totalStudents;
  final int absentPercentage;
  final int presentPercentage;
  final List<WeeklyAttendanceModel> weekly;
  final List<WeeklyAttendanceModel> allDays;

  ReportSuccess({
    required this.totalStudents,
    required this.absentPercentage,
    required this.presentPercentage,
    required this.weekly,
    required this.allDays,
  });
}

final class ReportFailure extends ReportState {}
