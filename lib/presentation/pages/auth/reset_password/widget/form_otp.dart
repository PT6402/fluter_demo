import 'package:demo_product_clear_architech/presentation/pages/auth/components/rouded_button.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/reset_password/widget/field_code.dart';
import 'package:flutter/material.dart';

class FormOtp extends StatefulWidget {
  const FormOtp({super.key});

  @override
  State<FormOtp> createState() => _FormOtpState();
}

class _FormOtpState extends State<FormOtp> {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController txtP1 = TextEditingController();
  TextEditingController txtP2 = TextEditingController();
  TextEditingController txtP3 = TextEditingController();
  TextEditingController txtP4 = TextEditingController();
  bool errorRequired = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    onSubmit() {
      if (txtP1.text.isNotEmpty &&
          txtP2.text.isNotEmpty &&
          txtP3.text.isNotEmpty &&
          txtP4.text.isNotEmpty) {
        String value = "${txtP1.text}${txtP2.text}${txtP3.text}${txtP4.text}";
        print(value);
        txtP1.clear();
        txtP2.clear();
        txtP3.clear();
        txtP4.clear();
      } else {
        setState(() {
          errorRequired = true;
        });
      }
    }

    return Form(
      key: keyForm,
      onChanged: () => setState(() {
        errorRequired = false;
      }),
      child: Column(
        children: [
          const Text(
            "OTP VERIFICATION",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FieldCode(controller: txtP1),
              FieldCode(controller: txtP2),
              FieldCode(controller: txtP3),
              FieldCode(controller: txtP4),
            ],
          ),
          if (errorRequired)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "is required",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ],
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
    );
  }
}
