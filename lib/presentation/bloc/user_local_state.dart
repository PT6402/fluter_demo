import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';

class UserLocalState {
  final UserEntity? user;
  const UserLocalState({this.user});
}

class GuestUserState extends UserLocalState {
  const GuestUserState();
}

class LoggedInUserState extends UserLocalState {
  const LoggedInUserState(UserEntity user) : super(user: user);
}
