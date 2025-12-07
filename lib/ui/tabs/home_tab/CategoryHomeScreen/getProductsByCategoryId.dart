/// بتستدعيلي ال ProductsByCategoryId

import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/model/CategoriesModel.dart';
import 'package:graduation_project/model/ProductModel.dart';
import 'package:graduation_project/ui/tabs/home_tab/EveryDayNeedsProduct/getEveryDayProducts.dart';
import 'package:graduation_project/ui/tabs/widgets/productCardwidget.dart';
import 'package:graduation_project/utils/app_colors.dart';

class GetProductsByCategoryId extends StatefulWidget {
  Category? categorie;

  GetProductsByCategoryId({super.key, required this.categorie});

  @override
  State<GetProductsByCategoryId> createState() =>
      _GetProductsByCategoryIdState();
}

class _GetProductsByCategoryIdState extends State<GetProductsByCategoryId> {
  @override
  Widget build(BuildContext context) {
    widget.categorie = ModalRoute.of(context)!.settings.arguments as Category?;
    return FutureBuilder(
      future: ApiManager.getProductByCategoryId(widget.categorie!),
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
                  ApiManager.getProductByCategoryId(widget.categorie!);
                  setState(() {});
                },
                child: Text("try again"),
              ),
            ],
          );
        }
        List<Product?> productList = snapshot.data!.products!;
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return productCardWidget(product: productList[index]!);
          },
        );
      },
    );
  }
}
