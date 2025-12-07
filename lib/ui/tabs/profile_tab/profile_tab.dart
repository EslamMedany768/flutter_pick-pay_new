import 'package:flutter/material.dart';
import 'package:graduation_project/ui/tabs/profile_tab/widgets/CustomFormFiledWithLabel.dart';
import 'package:graduation_project/utils/app_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.17,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pick & Pay", style: AppStyles.extraBold24Blue),
            SizedBox(height: height * 0.005),
            Text("Welcome, Mohamed", style: AppStyles.medium18blueDark),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your full name", style: AppStyles.medium16blueDark),
            SizedBox(height: height * 0.015),
            Customformfiledwithlabel(lable: "Mohamed Mohamed Nabil"),
            ///////////////////////////////////////////////////////////////////
            SizedBox(height: height * 0.02),
            Text("Your E-mail", style: AppStyles.medium16blueDark),
            SizedBox(height: height * 0.015),
            Customformfiledwithlabel(lable: "mohamed.N@gmail.com"),
            ///////////////////////////////////////////////////////////////////
            SizedBox(height: height * 0.02),
            Text("Your password", style: AppStyles.medium16blueDark),
            SizedBox(height: height * 0.015),
            Customformfiledwithlabel(
              lable: "**********************",
              isObsecure: true,
            ),
            SizedBox(height: height * 0.02),
            Text("Your mobile number", style: AppStyles.medium16blueDark),
            SizedBox(height: height * 0.015),
            Customformfiledwithlabel(lable: "01122118855"),
          ],
        ),
      ),
    );
  }
}
