import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

class AddOrRemoveButton extends StatefulWidget {
  AddOrRemoveButton({super.key});

  @override
  State<AddOrRemoveButton> createState() => _AddOrRemoveButtonState();
}

class _AddOrRemoveButtonState extends State<AddOrRemoveButton> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: height * 0.052,
      width: width * 0.330,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              removeFunc();
              setState(() {});
            },
            child: Icon(Icons.remove_circle, color: AppColors.white),
          ),
          Text("$count", style: AppStyles.extraBold18white),
          InkWell(
            onTap: () {
              addFunc();
              setState(() {});
            },
            child: Icon(Icons.add_circle, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  addFunc() {
    count++;
  }

  removeFunc() {
    if (count == 1) {
      return;
    } else {
      count--;
    }
  }
}
