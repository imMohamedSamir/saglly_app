import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/generate_excel.dart';
import 'package:hodory/features/ReportsView/data/models/weekly_attendance_model.dart';
import 'package:hodory/features/attendanceView/data/models/attendance_model.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit(this._repo) : super(ReportInitial());
  static ReportCubit get(context) => BlocProvider.of(context);
  final AttendanceRepo _repo;
  late List<AttendanceModel> _attendanceList;
  void getReport({required String classID, required DateTimeRange date}) async {
    emit(ReportLoading());
    final result = await _repo.getHistoryWithRangedDate(
      date: date,
      classID: classID,
    );
    result.fold(
      (fail) {
        emit(ReportFailure());
      },
      (history) {
        final uniqueStudentIds = history.map((e) => e.studentId).toSet();
        int totalStudents = uniqueStudentIds.length;
        int presents = history.where((element) => element.status == "P").length;
        int absents = history.where((element) => element.status == "A").length;
        int absentPercentage = ((absents / history.length) * 100).toInt();
        int presentPercentage = ((presents / history.length) * 100).toInt();
        final weekly = generateWeeklyAttendance(attendanceList: history);
        final allDAYS = generateFullWeeklyAttendance(attendanceList: history);
        _attendanceList = history;
        emit(
          ReportSuccess(
            totalStudents: totalStudents,
            absentPercentage: absentPercentage,
            presentPercentage: presentPercentage,
            weekly: weekly,
            allDays: allDAYS,
          ),
        );
      },
    );
  }

  List<WeeklyAttendanceModel> generateWeeklyAttendance({
    required List<AttendanceModel> attendanceList,
  }) {
    // Step 1: Extract unique last 7 dates
    final sortedDates =
        attendanceList
            .map((e) => DateTime.parse(e.date!.split(' ').first))
            .toSet()
            .toList()
          ..sort((a, b) => b.compareTo(a)); // descending

    final last7Dates = sortedDates.take(7).toList();

    // Step 2: Build WeeklyAttendanceModel list
    final List<WeeklyAttendanceModel> weeklyData = [];

    for (final date in last7Dates) {
      final dailyRecords =
          attendanceList.where((a) {
            final recordDate = DateTime.parse(a.date!.split(' ').first);
            return recordDate == date;
          }).toList();

      final int present = dailyRecords.where((a) => a.status == 'P').length;
      final int absent = dailyRecords.where((a) => a.status == 'A').length;
      final int total = present + absent;

      final int percentage = total == 0 ? 0 : ((present / total) * 100).round();

      final String day = DateFormat('E').format(date); // Mon, Tue, etc.

      weeklyData.add(
        WeeklyAttendanceModel(
          day: day,
          percentage: percentage,
          present: present,
          absent: absent,
        ),
      );
    }

    // Optional: Sort by oldest to newest
    weeklyData.sort(
      (a, b) => last7Dates
          .indexOf(DateFormat('E').parse(a.day))
          .compareTo(last7Dates.indexOf(DateFormat('E').parse(b.day))),
    );
    for (var element in weeklyData) {
      log(element.toJson().toString());
    }
    return weeklyData;
  }

  List<WeeklyAttendanceModel> generateFullWeeklyAttendance({
    required List<AttendanceModel> attendanceList,
  }) {
    // Step 1: Extract all unique dates from attendanceList
    final uniqueDates =
        attendanceList
            .map((e) => DateTime.parse(e.date!.split(' ').first))
            .toSet()
            .toList()
          ..sort((a, b) => a.compareTo(b)); // ascending from oldest to newest

    final List<WeeklyAttendanceModel> weeklyData = [];

    // Step 2: Loop over all unique dates
    for (final date in uniqueDates) {
      final dailyRecords =
          attendanceList.where((a) {
            final recordDate = DateTime.parse(a.date!.split(' ').first);
            return recordDate == date;
          }).toList();

      final int present = dailyRecords.where((a) => a.status == 'P').length;
      final int absent = dailyRecords.where((a) => a.status == 'A').length;
      final int total = present + absent;

      final int percentage = total == 0 ? 0 : ((present / total) * 100).round();

      final String day = DateFormat('dd MMM, yyyy').format(date);

      weeklyData.add(
        WeeklyAttendanceModel(
          day: day,
          percentage: percentage,
          present: present,
          absent: absent,
        ),
      );
    }

    return weeklyData;
  }

  void generateAndShareExcel() async {
    await exportAttendanceToExcel(_attendanceList);
  }

  void generateAndSharePdf() async {
    await generateAttendancePdf(attendanceList: _attendanceList);
  }
}
