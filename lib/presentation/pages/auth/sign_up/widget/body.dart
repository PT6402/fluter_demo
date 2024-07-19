import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_event.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_state.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/already_account.dart';

import 'package:demo_product_clear_architech/presentation/pages/auth/sign_up/widget/form_sign_up.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/sign_up/widget/socal_icon.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/sign_up/widget/background.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/sign_up/widget/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    loginGG() {
      BlocProvider.of<AuthRemoteBloc>(context).add(const RegisterGGUser());
    }

    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "SIGN UP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          const FormSignUp(),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyAccount(
            press: () => context.goNamed("login"),
            login: false,
          ),
          const OrDivider(),
          Center(
            child: SocalIcon(
              iconSrc: "assets/icons/google-icon.svg",
              press: loginGG,
            ),
          )
        ],
      ),
    ));
  }
}
