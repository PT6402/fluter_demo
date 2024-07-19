import 'package:demo_product_clear_architech/presentation/pages/auth/reset_password/widget/background.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/reset_password/widget/form_change_pass.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/reset_password/widget/form_otp.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isCheckedCode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Center(
        child: Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: isCheckedCode ? const FormChangePass() : const FormOtp()),
      ),
    ));
  }
}
