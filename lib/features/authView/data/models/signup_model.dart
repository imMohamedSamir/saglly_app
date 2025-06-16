class SignupModel {
  String? id;
  String? phone;
  String? name;
  String? email;
  String? gender;
  String? dateOfBirth;
  String? password;
  String? nid;
  String? passport;

  SignupModel({
    this.id,
    this.phone,
    this.name,
    this.email,
    this.gender,
    this.dateOfBirth,
    this.password,
    this.nid,
    this.passport,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'email': email,
      'gender': gender,
      // 'password': password,
    };
  }

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
    );
  }
  SignupModel copyWith({
    String? id,
    String? phone,
    String? name,
    String? email,
    String? gender,
    String? dateOfBirth,
    String? password,
    String? nid,
    String? passport,
  }) {
    return SignupModel(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      password: password ?? this.password,
      nid: nid ?? this.nid,
      passport: passport ?? this.passport,
    );
  }
}
