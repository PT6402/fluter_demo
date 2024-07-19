// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:demo_product_clear_architech/domain/entities/type_login.dart';
import 'package:demo_product_clear_architech/domain/entities/type_role.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "user", primaryKeys: ['email'])
class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.fullname,
    super.accessToken,
    super.refreshToken,
    super.typeLogin,
    super.typeRole,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'email': email,
        'fullname': fullname,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'typeLogin': typeLogin?.toMap(),
        'typeRole': typeRole?.toMap(),
      };

  @override
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        email: map['email'] != null ? map['email'] as String : null,
        fullname: map['fullname'] != null ? map['fullname'] as String : null,
        accessToken:
            map['access_token'] != null ? map['access_token'] as String : null,
        refreshToken: map['refresh_token'] != null
            ? map['refresh_token'] as String
            : null,
        typeLogin: map['type_login'] != null
            ? TypeLogin.fromMap(map['type_login'])
            : null,
        typeRole: map['role'] != null ? TypeRole.fromMap(map['role']) : null,
      );
  @override
  String toJson() => json.encode(toMap());

  @override
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromEntity(UserEntity userEntity) => UserModel(
      email: userEntity.email,
      fullname: userEntity.fullname,
      accessToken: userEntity.accessToken,
      refreshToken: userEntity.refreshToken,
      typeLogin: userEntity.typeLogin,
      typeRole: userEntity.typeRole);

  UserEntity toEntity() => UserEntity(
      email: email,
      fullname: fullname,
      accessToken: accessToken,
      refreshToken: refreshToken,
      typeRole: typeRole,
      typeLogin: typeLogin);
}
