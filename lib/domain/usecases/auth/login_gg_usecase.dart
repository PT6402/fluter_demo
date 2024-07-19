import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/core/usecase/usecase.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGgUsecase
    implements Usecase<DataState<UserEntity?>, ({String email})> {
  final AuthRepo _authRepo;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  LoginGgUsecase(this._authRepo);
  @override
  Future<DataState<UserEntity?>> call({({String email})? params}) async {
    try {
      var acc = await googleSignIn.signIn();
      if (acc != null) {
        var auth = await acc.authentication;
        return _authRepo.login(params!.email, auth.accessToken!);
      } else {
        throw Exception("gg fail");
      }
    } on DioException catch (e) {
      return DataFail(e);
    } finally {
      await googleSignIn.signOut();
    }
  }
}
