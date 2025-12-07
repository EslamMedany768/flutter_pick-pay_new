import 'package:flutter/material.dart';
import 'package:graduation_project/auth/register_screen.dart';
import 'package:graduation_project/ui/tabs/home_tab/home_tab.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import '../ui/home.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/label_textForm.dart';
import 'widget/text_formfiled_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        toolbarHeight: height * 0.027,
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
                SizedBox(height: height * 0.019),

                LabelTextform(text: "User Name"),
                SizedBox(height: height * 0.019),
                CustomTextFormFiledForAuth(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter your name";
                    } else {
                      return null;
                    }
                  },
                  hintText: "username",
                ),
                SizedBox(height: height * 0.0472),
                ////////////////////////////////
                LabelTextform(text: "Password"),
                SizedBox(height: height * 0.019),
                CustomTextFormFiledForAuth(
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter your password";
                    } else if (text.length < 6) {
                      return "Password must have at least 6 digits";
                    } else {
                      return null;
                    }
                  },
                  hintText: "Enter your password",
                  isSuffixIcon: true,
                  isPassword: true,
                ),
                SizedBox(height: height * 0.019),
                SizedBox(height: height * 0.019),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 85),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgotten Password ?",
                      style: AppStyles.medium16grey,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.050),

                CustomElevatedButton(
                  text: "Login",
                  onButtonClick: checkValidate,
                ),
                SizedBox(height: height * 0.060),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Don’t have an account?",
                    style: AppStyles.light18blue.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(13),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.white),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      backgroundColor: AppColors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Text(
                      "Create Account",
                      style: AppStyles.medium16grey.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkValidate() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }
}
