import 'package:demo_product_clear_architech/data/data_source/local/app_database.dart';
import 'package:demo_product_clear_architech/data/model/user_model.dart';
import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final AppDatabase _database;

  UserRepoImpl(this._database);

  @override
  Future<void> addUser(UserEntity userEntity) {
    return _database.userDao.addUser(UserModel.fromEntity(userEntity));
  }

  @override
  Future<void> deleteUser(UserEntity userEntity) {
    return _database.userDao.deletUser(UserModel.fromEntity(userEntity));
  }

  @override
  Future<UserEntity?> getUser() {
    return _database.userDao.getUser();
  }

  @override
  Future<void> updateUser(UserEntity userEntity) {
    return _database.userDao.updateUser(UserModel.fromEntity(userEntity));
  }
}
