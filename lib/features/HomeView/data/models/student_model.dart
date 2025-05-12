class StudentModel {
  String? id;
  String? name;
  String? classId;
  int? presentNo;
  int? absentNo;

  StudentModel({
    this.id,
    this.name,
    this.presentNo,
    this.absentNo,
    this.classId,
  });

  // fromJson factory
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['student_id'] as String?,
      name: json['student_name'] as String?,
      classId: json['class_id'] as String?,
      presentNo: json['present_count'] as int?,
      absentNo: json['absent_count'] as int?,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {'name': name, 'class_id': classId};
  }

  // copyWith method
  StudentModel copyWith({
    String? id,
    String? name,
    String? classId,

    int? presentNo,
    int? absentNo,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      classId: classId ?? this.classId,
      presentNo: presentNo ?? this.presentNo,
      absentNo: absentNo ?? this.absentNo,
    );
  }
}
