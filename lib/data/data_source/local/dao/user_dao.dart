import 'package:demo_product_clear_architech/data/model/user_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> addUser(UserModel userModel);

  @delete
  Future<void> deletUser(UserModel userModel);

  @update
  Future<void> updateUser(UserModel userModel);

  @Query("select * from user limit 1")
  Future<UserModel?> getUser();
}
