import 'package:demo_product_clear_architech/config/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () => context.goNamed("forgotPassword"),
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kPrimaryColor),
            ),
          )
        ],
      ),
    );
  }
}
