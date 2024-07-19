// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:demo_product_clear_architech/domain/entities/type_device.dart';
import 'package:demo_product_clear_architech/domain/entities/type_login.dart';

class RegisterReq {
  String? fullname;
  String? password;
  String? email;
  TypeDevice? typeDevice;
  TypeLogin? typeLogin;
  RegisterReq({
    this.fullname,
    this.password,
    this.email,
    this.typeDevice,
    this.typeLogin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'password': password,
      'email': email,
      'type_deivce': typeDevice?.value,
      'type_login': typeLogin?.value,
    };
  }

  factory RegisterReq.fromMap(Map<String, dynamic> map) {
    return RegisterReq(
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      typeDevice: map['type_device'] != null
          ? TypeDevice.fromMap(map['type_deivce'])
          : null,
      typeLogin: map['type_login'] != null
          ? TypeLogin.fromMap(map['type_login'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterReq.fromJson(String source) =>
      RegisterReq.fromMap(json.decode(source) as Map<String, dynamic>);
}
