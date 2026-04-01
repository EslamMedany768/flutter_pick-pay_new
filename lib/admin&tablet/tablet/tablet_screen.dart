import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_colors.dart';

class TabletScreen extends StatelessWidget {
  static const String routeName ="tablet screen";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: AppColors.blue)),
      ///todo:list from Api
    );
  }
}
