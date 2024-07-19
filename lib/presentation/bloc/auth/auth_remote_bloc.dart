import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/domain/usecases/auth/login_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/auth/register_gg_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/auth/register_usecase.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_event.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthRemoteBloc extends Bloc<AuthRemoteEvent, AuthRemoteState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final RegisterGgUsecase _registerGgUsecase;
  AuthRemoteBloc(
      this._loginUsecase, this._registerUsecase, this._registerGgUsecase)
      : super(const GuestUserStateRemote()) {
    on<LoginUser>(onLogin);
    on<RegisterUser>(onRegister);
    on<LogoutUser>(onLogout);
    on<RegisterGGUser>(onRegisterGG);
  }

  void onLogin(LoginUser loginUser, Emitter<AuthRemoteState> emit) async {
    var result = await _loginUsecase(params: loginUser.params);
    if (result is DataFail) {
      print(result.error!.response);
    }

    if (result is DataSuccess && result.data != null) {
      print(result.data);
      emit(LoggedInUserStateRemote(result.data!));
    }
  }

  void onRegister(
      RegisterUser registerUser, Emitter<AuthRemoteState> emit) async {
    var result = await _registerUsecase(params: registerUser.params);

    if (result is DataFail) {
      print("  bloc error ${result.message}");
    }

    if (result is DataSuccess) {
      emit(RegisterSuccess(registerUser.params?.email));
      print(result.message);
    }
  }

  void onRegisterGG(
      RegisterGGUser registerGGUser, Emitter<AuthRemoteState> emit) async {
    var result = await _registerGgUsecase();
    if (result is DataFail) {
      print("  bloc error ${result.message}");
    }

    if (result is DataSuccess) {
      emit(RegisterGGSuccess());
      print(result.message);
    }
  }

  void onLogout(LogoutUser logout, Emitter<AuthRemoteState> emit) {
    emit(const GuestUserStateRemote());
  }
}
