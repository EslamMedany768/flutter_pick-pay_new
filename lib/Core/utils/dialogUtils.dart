import 'package:flutter/material.dart';
import 'package:graduation_project/Core/utils/app_colors.dart';

class DialogUtils {
  static showLoading({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(color: AppColors.blue),
            SizedBox(width: 10),
            Text("Loading"),
          ],
        ),
      ),
    );
  }

  static hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static showMessage({
    required BuildContext context,
    required String title,
    Color? titleColor,
    required String posAction,
    Function? posActionFunc,
    required String content,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: TextStyle(color: titleColor)),
        content: Text(content, style: TextStyle(fontSize: 20)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              posActionFunc?.call();
            },
            child: Text(posAction, style: TextStyle(color: AppColors.blue)),
          ),
        ],
      ),
    );
  }
}
