import 'dart:io';

import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/auth/auth_api_service.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/dto/login_req.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/dto/register_req.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/dto/reset_password_req.dart';
import 'package:demo_product_clear_architech/domain/entities/type_device.dart';
import 'package:demo_product_clear_architech/domain/entities/type_login.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/auth_repo.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthApiService _authApiService;
  const AuthRepoImpl(this._authApiService);
  @override
  Future<DataState<void>> checkCodeReset(
      String email, String code, String accessToken) async {
    try {
      var req =
          ResetPasswordReq(email: email, code: code, accessToken: accessToken);
      var result = await _authApiService.checkCodeReset(req);
      if (result.response.statusCode == HttpStatus.ok) {
        return const DataSuccess(null, null);
      } else {
        return DataFail(DioException(
            requestOptions: result.response.requestOptions,
            type: DioExceptionType.badResponse,
            response: result.response,
            error: result.response.statusCode));
      }
    } on DioException catch (e) {
      return DataFail(e);
    }
  }

  @override
  Future<DataState<TypeLogin?>> checkTypeLogin(String email) async {
    try {
      var result = await _authApiService.checkTypeLogin(email);
      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(result.response.data, result.data as String);
      } else {
        return DataFail(DioException(
            requestOptions: result.response.requestOptions,
            error: result.response.statusCode,
            type: DioExceptionType.badResponse,
            response: result.response));
      }
    } on DioException catch (e) {
      return DataFail(e);
    }
  }

  @override
  Future<DataState<String?>> forgotPassword(String email) async {
    try {
      var result = await _authApiService.forgotPassword(email);
      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(result.response.data, result.data);
      } else {
        return DataFail(DioException(
            requestOptions: result.response.requestOptions,
            response: result.response,
            error: result.response.statusCode,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      return DataFail(e);
    }
  }

  @override
  Future<DataState<UserEntity?>> login(String email, String password) async {
    try {
      var req = LoginReq(
          email: email,
          password: password,
          typeDevice: TypeDevice.mobile,
          typeLogin: TypeLogin.email);
      var result = await _authApiService.login(req);
      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(result.data.model, result.data.message);
      } else {
        return DataFail(DioException(
            requestOptions: result.response.requestOptions,
            error: result.response.statusCode,
            response: result.response,
            type: DioExceptionType.badResponse,
            message: result.data.message));
      }
    } on DioException catch (e) {
      return DataFail(e);
    }
  }

  @override
  Future<DataState<UserEntity?>> register(String? fullname, String? email,
      String password, TypeLogin typeLogin) async {
    try {
      var req = RegisterReq(
          email: email,
          fullname: fullname,
          password: password,
          typeDevice: TypeDevice.mobile,
          typeLogin: typeLogin);

      var result = await _authApiService.register(req);
      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(result.data.model, result.data.message);
      } else {
        return DataFail(DioException(
            requestOptions: result.response.requestOptions,
            error: result.response.statusCode,
            response: result.response,
            type: DioExceptionType.badResponse,
            message: result.data.message));
      }
    } on DioException catch (e) {
      return DataFail(e);
    }
  }

  @override
  Future<DataState<void>> resetPassword(
      String email, String code, String newPassword, String accessToken) async {
    try {
      var req = ResetPasswordReq(
          email: email,
          code: code,
          accessToken: accessToken,
          newPassword: newPassword);

      var result = await _authApiService.resetPassword(req);
      if (result.response.statusCode == HttpStatus.ok) {
        return const DataSuccess(null, null);
      } else {
        return DataFail(DioException(
            requestOptions: result.response.requestOptions,
            error: result.response.statusCode,
            response: result.response,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      return DataFail(e);
    }
  }
}
