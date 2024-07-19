// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetPasswordReq {
  String? email;
  String? code;
  String? newPassword;
  String? accessToken;
  ResetPasswordReq({
    this.email,
    this.code,
    this.newPassword,
    this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'code': code,
      'newPassword': newPassword,
      'accessToken': accessToken,
    };
  }

  factory ResetPasswordReq.fromMap(Map<String, dynamic> map) {
    return ResetPasswordReq(
      email: map['email'] != null ? map['email'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      newPassword:
          map['new_password'] != null ? map['new_password'] as String : null,
      accessToken:
          map['new_password'] != null ? map['new_password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordReq.fromJson(String source) =>
      ResetPasswordReq.fromMap(json.decode(source) as Map<String, dynamic>);
}
