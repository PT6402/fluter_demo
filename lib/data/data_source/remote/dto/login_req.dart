// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:demo_product_clear_architech/domain/entities/type_device.dart';
import 'package:demo_product_clear_architech/domain/entities/type_login.dart';

class LoginReq {
  String? email;
  String? password;
  TypeLogin? typeLogin;
  TypeDevice? typeDevice;
  LoginReq({
    this.email,
    this.password,
    this.typeLogin,
    this.typeDevice,
  });

  LoginReq copyWith({
    String? email,
    String? password,
    TypeLogin? typeLogin,
    TypeDevice? typeDevice,
  }) {
    return LoginReq(
      email: email ?? this.email,
      password: password ?? this.password,
      typeLogin: typeLogin ?? this.typeLogin,
      typeDevice: typeDevice ?? this.typeDevice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'type_login': typeLogin?.value,
      'type_device': typeDevice?.value,
    };
  }

  factory LoginReq.fromMap(Map<String, dynamic> map) {
    return LoginReq(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      typeLogin: map['type_login'] != null
          ? TypeLogin.fromMap(map['type_login'])
          : null,
      typeDevice: map['type_login'] != null
          ? TypeDevice.fromMap(map['type_login'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginReq.fromJson(String source) =>
      LoginReq.fromMap(json.decode(source) as Map<String, dynamic>);
}
