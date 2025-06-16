class ProfileModel {
  String? id;
  String? phone;
  String? name;
  String? email;
  String? gender;
  ProfileModel({this.id, this.phone, this.name, this.email, this.gender});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
    );
  }
}
