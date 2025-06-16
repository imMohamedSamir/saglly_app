import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hodory/features/attendanceView/data/models/attendance_model.dart';

abstract class AttendanceRepo {
  Future<Either<String, dynamic>> addAttendance({
    required List<AttendanceModel> attendances,
  });
  Future<Either<String, List<AttendanceModel>>> getHistory({
    required String date,
    required String classID,
  });
  Future<Either<String, List<AttendanceModel>>> getHistoryWithRangedDate({
    required String classID,
    required DateTimeRange date,
  });
}
