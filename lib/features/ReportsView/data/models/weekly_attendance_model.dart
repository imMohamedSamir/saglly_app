class WeeklyAttendanceModel {
  final String day;
  final int percentage;
  final int present;
  final int absent;

  WeeklyAttendanceModel({
    required this.day,
    required this.percentage,
    required this.present,
    required this.absent,
  });
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      // 'teacher_id': teacherId,
      'percentage': percentage,
      'present': present,
      'absent': absent,
    };
  }
}
