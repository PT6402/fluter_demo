import 'package:demo_product_clear_architech/core/usecase/usecase.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/user_repo.dart';

class GetInforUserUsecase implements Usecase<UserEntity?, void> {
  final UserRepo _userRepo;
  GetInforUserUsecase(this._userRepo);
  @override
  Future<UserEntity?> call({void params}) {
    return _userRepo.getUser();
  }
}
