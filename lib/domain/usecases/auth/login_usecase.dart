import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/core/usecase/usecase.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/auth_repo.dart';

class LoginUsecase
    implements
        Usecase<DataState<UserEntity?>, ({String email, String password})> {
  final AuthRepo _authRepo;
  LoginUsecase(this._authRepo);
  @override
  Future<DataState<UserEntity?>> call(
      {({String email, String password})? params}) {
    return _authRepo.login(params!.email, params.password);
  }
}
