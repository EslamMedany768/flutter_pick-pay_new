import 'package:flutter/material.dart';


import '../../Core/utils/app_colors.dart';
import '../../Core/utils/app_styles.dart';

class Searchtextfiled extends StatelessWidget {
  String hint;

  Searchtextfiled({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_outlined,color: AppColors.blue,size: 24,),
        hintText: hint,
        hintStyle: AppStyles.light14blue,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),

      style: AppStyles.light14blue,
    );
  }
}
