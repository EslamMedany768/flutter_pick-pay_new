import 'package:flutter/material.dart';
import 'package:graduation_project/admin&tablet/admin/ui/widget/text_formfiled.dart';


import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_styles.dart';

class DeleteScreen extends StatefulWidget {
  static const String routeName = "delete_Screen";

  DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  var idController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(resizeToAvoidBottomInset: true,
      appBar: AppBar(iconTheme: IconThemeData(color: AppColors.blue)),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              CustomTextFormFiledForAddProduct(
                hintText: "id",
                validator: (text) {
                  if (text==null||text.trim().isEmpty) {
                    return "invalid";
                  }
                  return null;
                },
                controller: idController,
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  overlayColor: AppColors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
                  ),
                ),
                onPressed: () {
                  checkIsValid();
                },
                child: Text("Delete", style: AppStyles.medium20white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkIsValid(){
    if(formKey.currentState!.validate()==true){

    }
  }
}
