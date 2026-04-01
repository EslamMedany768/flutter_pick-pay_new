import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

class CardWidget extends StatelessWidget {
  String text;
  Function onButtonClicked;

  CardWidget({super.key, required this.text, required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          overlayColor: AppColors.blue,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        ),
        onPressed: () {
          onButtonClicked();
        },
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: AppStyles.semiBold20blue,
        ),
      ),
    );
  }
}
