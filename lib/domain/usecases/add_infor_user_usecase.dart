import 'package:demo_product_clear_architech/core/usecase/usecase.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/user_repo.dart';

class AddInforUserUsecase implements Usecase<void, UserEntity> {
  final UserRepo _userRepo;
  const AddInforUserUsecase(this._userRepo);
  @override
  Future<void> call({UserEntity? params}) {
    return _userRepo.addUser(params!);
  }
}
