import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  Function onButtonClick;
  String text;

  CustomElevatedButton({
    super.key,
    required this.onButtonClick,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      onPressed: () {
        onButtonClick();
      },
      child: Text(text, style: AppStyles.semiBold20blue),
    );
  }
}
