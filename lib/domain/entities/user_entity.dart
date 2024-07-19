import 'dart:convert';
import 'package:demo_product_clear_architech/domain/entities/type_login.dart';
import 'package:demo_product_clear_architech/domain/entities/type_role.dart';

class UserEntity {
  final String? email;
  final String? fullname;
  final String? accessToken;
  final String? refreshToken;
  final TypeLogin? typeLogin;
  final TypeRole? typeRole;
  UserEntity({
    this.email,
    this.fullname,
    this.accessToken,
    this.refreshToken,
    this.typeLogin,
    this.typeRole,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'fullname': fullname,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'typeLogin': typeLogin?.toMap(),
      'typeRole': typeRole?.toMap(),
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map['email'] != null ? map['email'] as String : null,
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      accessToken:
          map['access_token'] != null ? map['access_token'] as String : null,
      refreshToken:
          map['refresh_token'] != null ? map['refresh_token'] as String : null,
      typeLogin: map['type_login'] != null
          ? TypeLogin.fromMap(map['type_login'])
          : null,
      typeRole: map['role'] != null ? TypeRole.fromMap(map['role']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserEntity(email: $email, fullname: $fullname, accessToken: $accessToken, refreshToken: $refreshToken, typeLogin: $typeLogin, typeRole: $typeRole)';
  }
}
