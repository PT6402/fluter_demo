import 'package:demo_product_clear_architech/data/data_source/local/app_database.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/auth/auth_api_service.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/product_api_service.dart';
import 'package:demo_product_clear_architech/data/repository/auth_repo_impl.dart';
import 'package:demo_product_clear_architech/data/repository/product_repo_impl.dart';
import 'package:demo_product_clear_architech/data/repository/user_repo_impl.dart';
import 'package:demo_product_clear_architech/domain/repository/auth_repo.dart';
import 'package:demo_product_clear_architech/domain/repository/product_repo.dart';
import 'package:demo_product_clear_architech/domain/repository/user_repo.dart';
import 'package:demo_product_clear_architech/domain/usecases/add_infor_user_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/auth/login_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/auth/register_gg_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/auth/register_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/delete_product_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/get_infor_user_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/get_product_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/logout_user_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/save_product_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/update_infor_user_usecase.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/user_local_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final database =
      await $FloorAppDatabase.databaseBuilder("app_database.db").build();

  // database
  sl.registerSingleton<AppDatabase>(database);

  // dio
  sl.registerSingleton<Dio>(Dio());

  // [dependency-product]
  sl.registerSingleton<ProductApiService>(ProductApiService(sl()));
  sl.registerSingleton<ProductRepo>(ProductRepoImpl(sl()));

  // [dependency-user]
  sl.registerSingleton<UserRepo>(UserRepoImpl(sl()));

  // [dependency-auth]
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AuthRepo>(AuthRepoImpl(sl()));

  // [usecase-product-remote]
  sl.registerSingleton<GetProductUsecase>(GetProductUsecase(sl()));
  sl.registerSingleton<SaveProductUsecase>(SaveProductUsecase(sl()));
  sl.registerSingleton<DeleteProductUsecase>(DeleteProductUsecase(sl()));

  // [usecase-user-local]
  sl.registerSingleton<GetInforUserUsecase>(GetInforUserUsecase(sl()));
  sl.registerSingleton<AddInforUserUsecase>(AddInforUserUsecase(sl()));
  sl.registerSingleton<UpdateInforUserUsecase>(UpdateInforUserUsecase(sl()));
  sl.registerSingleton<LogoutUserUsercase>(LogoutUserUsercase(sl()));

  // [usecase-user-remote]
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase(sl()));
  sl.registerSingleton<RegisterGgUsecase>(RegisterGgUsecase(sl()));

  // [bloc]
  sl.registerFactory<ProductRemoteBloc>(
      () => ProductRemoteBloc(sl(), sl(), sl()));
  sl.registerFactory<UserLocalBloc>(
      () => UserLocalBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory<AuthRemoteBloc>(() => AuthRemoteBloc(sl(), sl(), sl()));
}
