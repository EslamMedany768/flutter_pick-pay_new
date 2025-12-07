import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

class Customformfiledwithlabel extends StatelessWidget {
  String lable;
  bool isObsecure;

  Customformfiledwithlabel({
    super.key,
    required this.lable,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.blueDark,
      obscureText: isObsecure,
      style: TextStyle(
        decorationThickness: 0,
        color: AppColors.blueDark,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: AppStyles.medium16blueDark,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: ImageIcon(
            AssetImage("assets/images/edit_icon.png"),
            color: AppColors.blueDark,
          ),
        ),
      ),
    );
  }
}
