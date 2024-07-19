import 'package:demo_product_clear_architech/presentation/pages/auth/components/already_account.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_button.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_input_field.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_password_field.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/forgot_password/widget/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keyForm = GlobalKey<FormState>();
    TextEditingController txtEmail = TextEditingController();
    Size size = MediaQuery.of(context).size;

    onSubmit() {
      if (keyForm.currentState!.validate()) {
        var value = txtEmail.text;
        print(value);
        context.goNamed("resetPassword");
      }
    }

    return Background(
        child: Form(
      key: keyForm,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "FORGOT PASSWORD",
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
          SizedBox(
            height: size.height * 0.03,
          ),
          RoudedButton(
            text: "Send",
            press: onSubmit,
            textColor: Colors.white,
          ),
        ],
      ),
    ));
  }
}
