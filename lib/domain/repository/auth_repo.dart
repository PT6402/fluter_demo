import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/domain/entities/type_login.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';

abstract class AuthRepo {
  // remote
  Future<DataState<UserEntity?>> login(String email, String password);
  Future<DataState<TypeLogin?>> checkTypeLogin(String email);
  Future<DataState<String?>> forgotPassword(String email);

  Future<DataState<UserEntity?>> register(
      String? fullname, String? email, String password, TypeLogin typeLogin);
  Future<DataState<void>> resetPassword(
      String email, String code, String newPassword, String accessToken);
  Future<DataState<void>> checkCodeReset(
      String email, String code, String accessToken);
}
