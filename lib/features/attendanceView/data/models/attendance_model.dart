class AttendanceModel {
  final String? classId;
  final String? teacherId;
  final String? studentId;
  final String? studentName;
  final String? date;
  final String? status;

  AttendanceModel({
    this.classId,
    this.teacherId,
    this.studentId,
    this.date,
    this.status,
    this.studentName,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      classId: json['class_id'] as String?,
      // teacherId: json['teacherId'] as String?,
      studentId: json['student_id'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      studentName: json['student_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      // 'teacher_id': teacherId,
      'student_id': studentId,
      'date': date,
      'status': status,
    };
  }

  AttendanceModel copyWith({
    String? classId,
    String? teacherId,
    String? studentId,
    String? date,
    String? status,
  }) {
    return AttendanceModel(
      classId: classId ?? this.classId,
      teacherId: teacherId ?? this.teacherId,
      studentId: studentId ?? this.studentId,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }
}
