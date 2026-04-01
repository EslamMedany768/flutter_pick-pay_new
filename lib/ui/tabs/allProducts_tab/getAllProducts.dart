import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/api/end_point.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import '../../../admin&tablet/admin/model/product_model.dart';
import '../widgets/productCardwidget.dart';

class GetAllproducts extends StatefulWidget {

   GetAllproducts({super.key});

  @override
  State<GetAllproducts> createState() => _GetAllproductsState();
}

class _GetAllproductsState extends State<GetAllproducts> {
  ApiManager apiManager=ApiManager();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiManager.getAllProducts(EndPoint: EndPoints.getAllProducts),
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
                  apiManager.getAllProducts(EndPoint: EndPoints.getAllProducts);
                  setState(() {});
                },
                child: Text("try again", style: AppStyles.medium18blueDark),
              ),
            ],
          );
        }
        List<Product?> productsList = snapshot.data!.products!;
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12),
          itemCount: productsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.45,
          ),
          itemBuilder: (context, index) {
            return productCardWidget(product: productsList[index]!);
          },
        );
      },
    );
  }
}
