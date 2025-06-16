import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hodory/core/utlis/Constatnts.dart';
import 'package:hodory/core/utlis/Supabase_services.dart';
import 'package:hodory/features/attendanceView/data/models/attendance_model.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo.dart';

class AttendanceRepoImpl implements AttendanceRepo {
  final SupabaseServices _services;

  AttendanceRepoImpl({required SupabaseServices services})
    : _services = services;
  @override
  Future<Either<String, dynamic>> addAttendance({
    required List<AttendanceModel> attendances,
  }) async {
    try {
      final currentAttendance = attendances.map((e) => e.toJson()).toList();
      final response = await _services.insert(
        isItems: true,
        table: AppConstatnts.attendance,
        values: currentAttendance,
      );
      log(response.toString());

      return right(response);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, List<AttendanceModel>>> getHistory({
    required String date,
    required String classID,
  }) async {
    try {
      final response = await _services.get(
        table: AppConstatnts.history,
        filters: {'date': date, 'class_id': classID},
      );
      List<AttendanceModel> history = [];
      for (var element in response) {
        history.add(AttendanceModel.fromJson(element));
      }
      return right(history);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, List<AttendanceModel>>> getHistoryWithRangedDate({
    required String classID,
    required DateTimeRange date,
  }) async {
    try {
      final response = await _services.get(
        table: AppConstatnts.history,
        filters: {'class_id': classID},
        startDate: date.start.toIso8601String(),
        endDate: date.end.toIso8601String(),
      );
      List<AttendanceModel> history = [];
      for (var element in response) {
        history.add(AttendanceModel.fromJson(element));
      }
      return right(history);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }
}
