import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/features/attendanceView/data/models/attendance_model.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo.dart';
import 'package:meta/meta.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._repo) : super(HistoryInitial());
  static HistoryCubit get(context) => BlocProvider.of(context);
  final AttendanceRepo _repo;
  void getHistory({required String date, required String classID}) async {
    emit(HistoryLoading());
    final response = await _repo.getHistory(date: date, classID: classID);
    response.fold(
      (fail) {
        emit(HistoryFailure());
      },
      (history) {
        int presents = history.where((element) => element.status == "P").length;
        int absents = history.where((element) => element.status == "A").length;
        emit(
          HistorySuccess(
            history: history,
            totalStudnets: history.length,
            totalPresent: presents,
            totalAbsent: absents,
          ),
        );
      },
    );
  }
}
