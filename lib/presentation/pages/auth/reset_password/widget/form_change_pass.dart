import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_button.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_password_field.dart';
import 'package:flutter/material.dart';

class FormChangePass extends StatelessWidget {
  const FormChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keyForm = GlobalKey<FormState>();
    TextEditingController txtNewpassword = TextEditingController();
    Size size = MediaQuery.of(context).size;
    onSubmit() {
      if (keyForm.currentState!.validate()) {
        final value = txtNewpassword.text;
        print(value);
      }
    }

    return Form(
        key: keyForm,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            RoudedPasswordField(
              hintText: "new password",
              controller: txtNewpassword,
              validate: (value) {
                if (value!.isEmpty) {
                  return "is required";
                }
                return null;
              },
            ),
            RoudedPasswordField(
              hintText: "confirm password",
              controller: txtNewpassword,
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
              text: "Reset",
              press: onSubmit,
              textColor: Colors.white,
            ),
          ],
        ));
  }
}
