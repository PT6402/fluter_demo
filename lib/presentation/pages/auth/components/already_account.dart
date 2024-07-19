import 'package:demo_product_clear_architech/config/theme/app_color.dart';
import 'package:flutter/widgets.dart';

class AlreadyAccount extends StatelessWidget {
  final bool login;
  final dynamic press;
  const AlreadyAccount({
    super.key,
    this.login = true,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account ? " : "Already account ? ",
          style: TextStyle(color: AppColor.kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign up" : "Login",
            style: TextStyle(
                color: AppColor.kPrimaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.kPrimaryColor),
          ),
        )
      ],
    );
  }
}
