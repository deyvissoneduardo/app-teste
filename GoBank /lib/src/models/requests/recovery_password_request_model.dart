// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RecoveryPasswordRequestModel {
  final String? token;
  final String? email;

  RecoveryPasswordRequestModel({this.token, this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'email': email,
    };
  }

  factory RecoveryPasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return RecoveryPasswordRequestModel(
      token: map['token'] != null ? map['token'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecoveryPasswordRequestModel.fromJson(String source) =>
      RecoveryPasswordRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
