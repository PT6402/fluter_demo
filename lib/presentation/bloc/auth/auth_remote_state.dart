import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';

class AuthRemoteState {
  final UserEntity? user;
  final String? email;
  const AuthRemoteState({this.user, this.email});
}

class GuestUserStateRemote extends AuthRemoteState {
  const GuestUserStateRemote();
}

class LoggedInUserStateRemote extends AuthRemoteState {
  const LoggedInUserStateRemote(UserEntity user) : super(user: user);
}

class RegisterSuccess extends AuthRemoteState {
  const RegisterSuccess(String email) : super(email: email);
}

class RegisterGGSuccess extends AuthRemoteState {}
