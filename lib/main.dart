import 'package:demo_product_clear_architech/config/routes/router_provider.dart';
import 'package:demo_product_clear_architech/injection_container.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_state.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_event.dart';
import 'package:demo_product_clear_architech/presentation/bloc/user_local_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/user_local_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<ProductRemoteBloc>()..add(GetProduct())),
        BlocProvider(create: (context) => sl<UserLocalBloc>()..add(GetInfor())),
        BlocProvider(create: (context) => sl<AuthRemoteBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: RouterProvider.router,
      ),
    );
  }
}
