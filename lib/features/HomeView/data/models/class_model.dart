import 'student_model.dart';

class ClassModel {
  final String? id;
  String? name;
  String? desc;
  int? studentNo;

  ClassModel({this.id, this.name, this.desc, this.studentNo});

  // fromJson factory
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['class_id'] as String?,
      name: json['class_name'] as String?,
      studentNo: json['student_count'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {'name': name, 'desc': desc};
  }

  // copyWith method
  ClassModel copyWith({
    String? id,
    String? name,
    int? studentNo,

    List<StudentModel>? students,
  }) {
    return ClassModel(
      id: id ?? this.id,
      name: name ?? this.name,
      studentNo: studentNo ?? this.studentNo,
    );
  }
}
