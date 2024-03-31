// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  late String id;
  late String email;
  late String photo;
  late String role;

  UserModel({
    required this.id,
    required this.email,
    required this.photo,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      photo: json['photo'],
      role: json['role'],
    );
  }
}
