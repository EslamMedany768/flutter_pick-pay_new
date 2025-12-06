import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

class CustomTextFormFiledForAuth extends StatefulWidget {
  final bool isSuffixIcon;
  String hintText;
  bool isPassword;
  TextInputType? type;
  TextEditingController? controller;
  String? Function(String?)? validator;

  CustomTextFormFiledForAuth({
    super.key,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.type,
    this.isSuffixIcon = false,
    required this.hintText,
  });

  @override
  State<CustomTextFormFiledForAuth> createState() =>
      _CustomTextFormFiledForAuthState();
}

class _CustomTextFormFiledForAuthState
    extends State<CustomTextFormFiledForAuth> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorErrorColor: Colors.red,
      keyboardType: widget.type,
      validator: widget.validator,
      controller: widget.controller,
      style: AppStyles.light18blue,
      obscureText: widget.isPassword,
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: AppColors.white,
        filled: true,

        suffixIcon: widget.isSuffixIcon == true
            ? IconButton(
                onPressed: () {
                  widget.isPassword = !widget.isPassword;
                  setState(() {});
                },
                icon: Icon(
                  widget.isPassword == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.blue,
                ),
              )
            : null,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.white, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
