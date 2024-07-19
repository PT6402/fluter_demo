import 'package:demo_product_clear_architech/domain/entities/user_entity.dart';

class UserLocalEvent {
  final UserEntity? user;
  const UserLocalEvent({this.user});
}

class GetInfor extends UserLocalEvent {}

class AddInfor extends UserLocalEvent {
  const AddInfor(UserEntity addInforUser) : super(user: addInforUser);
}

class UpdateInfor extends UserLocalEvent {
  const UpdateInfor(UserEntity updateInforUser) : super(user: updateInforUser);
}

class DeleteInfor extends UserLocalEvent {
  const DeleteInfor(UserEntity deleteInforUser) : super(user: deleteInforUser);
}
