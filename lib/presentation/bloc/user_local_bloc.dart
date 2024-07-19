import 'package:demo_product_clear_architech/domain/usecases/add_infor_user_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/get_infor_user_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/logout_user_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/update_infor_user_usecase.dart';
import 'package:demo_product_clear_architech/presentation/bloc/user_local_event.dart';
import 'package:demo_product_clear_architech/presentation/bloc/user_local_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLocalBloc extends Bloc<UserLocalEvent, UserLocalState> {
  final GetInforUserUsecase _getInforUserUsecase;
  final AddInforUserUsecase _addInforUserUsecase;
  final UpdateInforUserUsecase _updateInforUserUsecase;
  final LogoutUserUsercase _logoutUserUsercase;

  UserLocalBloc(this._addInforUserUsecase, this._getInforUserUsecase,
      this._logoutUserUsercase, this._updateInforUserUsecase)
      : super(const GuestUserState()) {
    on<GetInfor>(onGetInfor);
    on<AddInfor>(onAddInfor);
    on<UpdateInfor>(onUpdateInfor);
    on<DeleteInfor>(onDeleteInfor);
  }

  void onGetInfor(GetInfor getInfor, Emitter<UserLocalState> emit) async {
    final inforUser = await _getInforUserUsecase();
    if (inforUser != null) {
      emit(LoggedInUserState(inforUser));
    }
  }

  void onAddInfor(AddInfor addInfor, Emitter<UserLocalState> emit) async {
    await _addInforUserUsecase(params: addInfor.user);
  }

  void onUpdateInfor(
      UpdateInfor updateInfor, Emitter<UserLocalState> emit) async {
    await _updateInforUserUsecase(params: updateInfor.user);
  }

  void onDeleteInfor(
      DeleteInfor deleteInfor, Emitter<UserLocalState> emit) async {
    await _logoutUserUsercase(params: deleteInfor.user);
  }
}
