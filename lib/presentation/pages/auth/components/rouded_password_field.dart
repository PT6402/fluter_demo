import 'package:demo_product_clear_architech/config/theme/app_color.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RoudedPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  const RoudedPasswordField({
    super.key,
    this.hintText = "Password",
    this.validate,
    this.controller,
  });

  @override
  State<RoudedPasswordField> createState() => _RoudedPasswordFieldState();
}

class _RoudedPasswordFieldState extends State<RoudedPasswordField> {
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? validateConfirm(value) {
      if (value.isEmpty) {
        return "is required";
      }

      if (widget.controller!.text != value) {
        return "not match";
      }
      return null;
    }

    return TextFieldContainer(
        child: TextFormField(
      controller:
          widget.hintText == "confirm password" ? null : widget.controller,
      obscureText: _obscureText,
      validator: widget.hintText == "confirm password"
          ? validateConfirm
          : widget.validate,
      decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            IconlyLight.lock,
            color: AppColor.kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: _toggle,
            child: Icon(
              _obscureText
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 24,
              color: AppColor.kPrimaryColor,
            ),
          ),
          border: InputBorder.none),
    ));
  }
}
