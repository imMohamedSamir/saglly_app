part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistorySuccess extends HistoryState {
  final List<AttendanceModel> history;
  final int totalStudnets;
  final int totalPresent;
  final int totalAbsent;

  HistorySuccess({
    required this.history,
    required this.totalStudnets,
    required this.totalPresent,
    required this.totalAbsent,
  });
}

final class HistoryFailure extends HistoryState {}
