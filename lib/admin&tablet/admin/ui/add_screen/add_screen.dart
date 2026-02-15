import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import '../widget/text_formfiled.dart';

class AddScreen extends StatelessWidget {
  static const String routeName = "addScreen";
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var weightController = TextEditingController();
  var priceController = TextEditingController();
  var currentStockController = TextEditingController();
  var categoryIdController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: AppColors.blue)),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Add Product", style: AppStyles.semiBold20blue),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormFiledForAddProduct(
                  validator: (text) {
                    ///todo:strong validator
                    if (text==null||text.trim().isEmpty) {
                      return "invalid";
                    }
                    return null;
                  },
                  hintText: " Name",
                  controller: nameController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormFiledForAddProduct(
                  hintText: " id",
                  controller: idController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormFiledForAddProduct(
                  hintText: " weight",
                  controller: weightController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormFiledForAddProduct(
                  hintText: "price",
                  controller: priceController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormFiledForAddProduct(
                  hintText: "currentStock",
                  controller: currentStockController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormFiledForAddProduct(
                  hintText: "pictureUrl",
                  controller: currentStockController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormFiledForAddProduct(
                  hintText: "categoryId",
                  controller: categoryIdController,
                ),
              ),
              SizedBox(height: height * 0.03),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                onPressed: () {
                  ///todo:toast or alert dialog
                },
                child: Text("Add", style: AppStyles.medium20white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
