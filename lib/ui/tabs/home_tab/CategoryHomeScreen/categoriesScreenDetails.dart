///هنا بعرض products علي حسب الid بتاع الcategory الي الuser اختارها

import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import '../../../../data/model/CategoriesModel.dart';
import 'getProductsByCategoryId.dart';

class CategoriesScreenDetails extends StatelessWidget {
  static const String routeName = "CategoriesDetails";

  const CategoriesScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var args = ModalRoute.of(context)!.settings.arguments as Category?;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        iconTheme: IconThemeData(color: AppColors.blue),
        centerTitle: true,
        title: Text("${args!.name}", style: AppStyles.extraBold24Blue),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(child: GetProductsByCategoryId(categorie: args))],
      ),
    );
  }
}
