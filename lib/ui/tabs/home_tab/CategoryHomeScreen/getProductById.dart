import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/model/CategoriesModel.dart';
import 'package:graduation_project/model/ProductModel.dart';
import 'package:graduation_project/ui/tabs/home_tab/EveryDayNeedsProduct/getEveryDayProduct.dart';
import 'package:graduation_project/ui/tabs/home_tab/EveryDayNeedsProduct/productCardwidget.dart';
import 'package:graduation_project/utils/app_colors.dart';

class Getproductbyid extends StatefulWidget {
  Category categorie;

  Getproductbyid({super.key, required this.categorie});

  @override
  State<Getproductbyid> createState() => _GetproductbyidState();
}

class _GetproductbyidState extends State<Getproductbyid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getProductByCategoryId(widget.categorie),
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
                  ApiManager.getProductByCategoryId(widget.categorie);
                  setState(() {});
                },
                child: Text("try again"),
              ),
            ],
          );
        }
        List<Products?> productList = snapshot.data!.products!;
        return GridView.builder(
          itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 14, left: 14),
              child: productCardWidget(product: productList[index]!),
            );
          },
        );
      },
    );
  }
}
