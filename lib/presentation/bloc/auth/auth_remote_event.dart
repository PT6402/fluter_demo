import 'package:demo_product_clear_architech/domain/entities/type_login.dart';

class AuthRemoteEvent {
  final dynamic params;
  const AuthRemoteEvent({this.params});
}

class LoginUser extends AuthRemoteEvent {
  const LoginUser(
      ({
        String email,
        String password,
      }) params)
      : super(params: params);
}

class RegisterUser extends AuthRemoteEvent {
  const RegisterUser(
      ({
        String fullname,
        String email,
        String password,
      }) params)
      : super(params: params);
}

class RegisterGGUser extends AuthRemoteEvent {
  const RegisterGGUser();
}

class LogoutUser extends AuthRemoteEvent {
  const LogoutUser();
}
