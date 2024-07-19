import 'package:demo_product_clear_architech/domain/entities/type_login.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_bloc.dart';
import 'package:demo_product_clear_architech/presentation/bloc/auth/auth_remote_event.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_button.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_input_field.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keyForm = GlobalKey<FormState>();
    final TextEditingController txtFullname = TextEditingController();
    final TextEditingController txtEmail = TextEditingController();
    final TextEditingController txtPassword = TextEditingController();
    Size size = MediaQuery.of(context).size;

    onSubmit() {
      if (keyForm.currentState!.validate()) {
        ({
          String fullname,
          String email,
          String password,
        }) value = (
          fullname: txtFullname.text,
          email: txtEmail.text,
          password: txtPassword.text,
        );
        BlocProvider.of<AuthRemoteBloc>(context).add(RegisterUser(value));
      }
    }

    return Form(
        key: keyForm,
        child: Column(
          children: [
            RoudedInputField(
              hintText: "fullname",
              icon: IconlyLight.profile,
              controller: txtFullname,
              validate: (value) {
                if (value!.isEmpty) {
                  return "is required";
                }
                return null;
              },
            ),
            RoudedInputField(
              controller: txtEmail,
              hintText: "email",
              icon: IconlyLight.profile,
              validate: (value) {
                if (value!.isEmpty) {
                  return "is required";
                }
                return null;
              },
            ),
            RoudedPasswordField(
              hintText: "password",
              controller: txtPassword,
              validate: (value) {
                if (value!.isEmpty) {
                  return "is required";
                }
                return null;
              },
            ),
            RoudedPasswordField(
              hintText: "confirm password",
              controller: txtPassword,
              validate: (value) {
                if (value!.isEmpty) {
                  return "is required";
                }
                return null;
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoudedButton(
              text: "Sign up",
              press: onSubmit,
              textColor: Colors.white,
            ),
          ],
        ));
  }
}
