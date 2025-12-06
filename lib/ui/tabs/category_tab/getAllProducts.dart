import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/model/ProductModel.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import '../home_tab/EveryDayNeedsProduct/productCardwidget.dart';

class Getallproducts extends StatefulWidget {
  const Getallproducts({super.key});
  @override
  State<Getallproducts> createState() => _GetallproductsState();
}

class _GetallproductsState extends State<Getallproducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.blue),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("connection error"),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getAllProducts();
                  setState(() {});
                },
                child: Text("try again", style: AppStyles.medium18blueDark),
              ),
            ],
          );
        }
        List<Products?> productsList = snapshot.data!.products!;
        return Expanded(
          child: GridView.builder(
            itemCount: productsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.5,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 14, left: 14),
                child: productCardWidget(product: productsList[index]!),
              );
            },
          ),
        );
      },
    );
  }
}
