import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/core/usecase/usecase.dart';
import 'package:demo_product_clear_architech/domain/entities/type_login.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/auth_repo.dart';

class RegisterUsecase
    implements
        Usecase<
            DataState<UserEntity?>,
            ({
              String fullname,
              String email,
              String password,
            })> {
  final AuthRepo _authRepo;
  RegisterUsecase(this._authRepo);
  @override
  Future<DataState<UserEntity?>> call(
      {({
        String fullname,
        String email,
        String password,
      })? params}) {
    return _authRepo.register(
        params!.fullname, params.email, params.password, TypeLogin.email);
  }
}
