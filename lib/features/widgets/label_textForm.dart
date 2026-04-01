import 'package:flutter/material.dart';

import '../../Core/utils/app_styles.dart';


class LabelTextform extends StatelessWidget {
  String text;
   LabelTextform({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: AppStyles.extraBold18white,);
  }
}
