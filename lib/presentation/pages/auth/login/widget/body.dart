import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_event.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_state.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/already_account.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_button.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_input_field.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_password_field.dart';

import 'package:demo_product_clear_architech/presentation/pages/auth/login/widget/background.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/login/widget/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    onSubmit() {
      if (keyForm.currentState!.validate()) {
        ({String email, String password}) value =
            (email: txtEmail.text, password: txtPassword.text);
        BlocProvider.of<AuthRemoteBloc>(context).add(LoginUser(value));
      }
    }

    return BlocListener<AuthRemoteBloc, AuthRemoteState>(
      listener: (context, state) {
        print(state.email);
        if (state.email != null) {
          txtEmail.text = state.email!;
        }
      },
      child: Background(
          child: Form(
        key: keyForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoudedInputField(
              hintText: "email",
              icon: IconlyLight.profile,
              controller: txtEmail,
              validate: (value) {
                if (value!.isEmpty) {
                  return "required";
                }
                return null;
              },
            ),
            RoudedPasswordField(
              hintText: "password",
              controller: txtPassword,
              validate: (value) {
                if (value!.isEmpty) {
                  return "required";
                }
                return null;
              },
            ),
            const ForgotPassword(),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoudedButton(
              text: "Login",
              press: onSubmit,
              textColor: Colors.white,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyAccount(
              press: () => context.goNamed("signUp"),
            ),
          ],
        ),
      )),
    );
  }
}
