import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';

abstract class UserRepo {
  //local
  Future<UserEntity?> getUser();
  Future<void> addUser(UserEntity userEntity);
  Future<void> deleteUser(UserEntity userEntity);
  Future<void> updateUser(UserEntity userEntity);
}
