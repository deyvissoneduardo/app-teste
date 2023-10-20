import 'dart:convert';

class UserRegisterModel {
  final String email;
  final String password;
  final String name;
  final String document;
  final String phoneNumber;

  UserRegisterModel({
    required this.email,
    required this.password,
    required this.name,
    required this.document,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
      'document': document,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserRegisterModel.fromMap(Map<String, dynamic> map) {
    return UserRegisterModel(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      document: map['document'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRegisterModel.fromJson(String source) =>
      UserRegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
