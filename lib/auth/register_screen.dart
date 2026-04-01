import 'package:flutter/material.dart';

import 'package:graduation_project/auth/widget/text_formfiled_auth.dart';

import '../Core/utils/app_colors.dart';
import '../features/ui/home_screen.dart';
import '../features/widgets/custom_elevated_button.dart';
import '../features/widgets/label_textForm.dart';


class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        toolbarHeight: height * 0.04,
        backgroundColor: AppColors.blue,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/Pick&pay_Logo.png",
                  fit: BoxFit.fill,
                ),
                LabelTextform(text: "Full Name"),

                CustomTextFormFiledForAuth(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter name";
                    } else {
                      return null;
                    }
                  },
                  hintText: "Enter your full name",
                ),
                SizedBox(height: height * 0.02),

                ///
                LabelTextform(text: "Mobile Number"),

                CustomTextFormFiledForAuth(
                  hintText: "Enter your mobile number",
                  type: TextInputType.phone,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please your mobile number";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.02),

                ///
                LabelTextform(text: "E-mail address"),

                CustomTextFormFiledForAuth(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter your email";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(text)) {
                      return "enter valid email";
                    } else {
                      return null;
                    }
                  },
                  hintText: "Enter your email address",
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: height * 0.02),

                ///
                LabelTextform(text: "Password"),
                CustomTextFormFiledForAuth(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter name";
                    } else if (text.length < 6) {
                      return "Password must have at least 6 digits";
                      ;
                    } else {
                      return null;
                    }
                  },
                  hintText: "Enter your password",
                  isSuffixIcon: true,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: height * 0.04),

                ///
                CustomElevatedButton(
                  onButtonClick: checkValidate,
                  text: "Sign up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkValidate() {
    if (formKey.currentState!.validate() == true) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }
}
