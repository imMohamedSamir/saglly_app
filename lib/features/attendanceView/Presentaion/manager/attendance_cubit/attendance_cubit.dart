import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/ToastificationMethod.dart';
import 'package:hodory/features/attendanceView/data/models/attendance_model.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo.dart';
import 'package:hodory/main.dart';

import 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit(this._classId, this._repo) : super(const AttendanceState());
  static AttendanceCubit get(context) => BlocProvider.of(context);
  final AttendanceRepo _repo;
  final String _classId;
  List<AttendanceModel> attendanceList = [];
  final String _today =
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).toIso8601String();
  void takeAttendance({required String value, required String studentId}) {
    final index = attendanceList.indexWhere(
      (e) =>
          e.studentId == studentId && e.classId == _classId && e.date == _today,
    );
    final newEntry = AttendanceModel(
      classId: _classId,
      studentId: studentId,
      status: value,
      date: _today,
    );
    if (index != -1) {
      attendanceList[index] = newEntry;
    } else {
      attendanceList.add(newEntry);
    }
    final int present = attendanceList.where((e) => e.status == "P").length;
    final int absent = attendanceList.where((e) => e.status == "A").length;
    emit(state.copyWith(totalPresent: present, totalAbsent: absent));
  }

  void submit() async {
    emit(state.copyWith(isAddLoading: true));
    final response = await _repo.addAttendance(attendances: attendanceList);
    response.fold(
      (fail) {
        emit(state.copyWith(isAddLoading: false));
        CustomToastification.errorDialog(content: "there was an error");
      },
      (succee) {
        emit(state.copyWith(isAddLoading: false));
        CustomToastification.successDialog(
          content: "Attendance submitted successfully",
        );
        Navigator.pop(navigatorKey.currentContext!);
      },
    );
  }
}
