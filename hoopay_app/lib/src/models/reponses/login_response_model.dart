// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginResponseModel {
  final String? email;
  final List<String>? roles;
  final String? token;
  final bool? is2AF;

  LoginResponseModel({
    this.email,
    this.roles,
    this.token,
    this.is2AF,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'roles': roles,
      'token': token,
      'is2AF': is2AF,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      email: map['email'],
      token: map['token'],
      is2AF: map['is2AF'],
      roles: map['roles'] != null ? List<String>.from((map['roles'])) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
