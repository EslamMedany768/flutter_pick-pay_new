import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/ui/tabs/home_tab/EveryDayNeedsProduct/productCardwidget.dart';
import 'package:graduation_project/utils/app_colors.dart';

import '../../../../model/ProductModel.dart';
import '../../../../utils/app_styles.dart';

class getProductcardwidget extends StatefulWidget {
  getProductcardwidget({super.key});

  @override
  State<getProductcardwidget> createState() => _getProductcardwidgetState();
}

class _getProductcardwidgetState extends State<getProductcardwidget> {
  late Future<ProductModel?> getEveryDayNeeds;

  @override
  void initState() {
    // TODO: implement initState
    getEveryDayNeeds = ApiManager.getEveryDayNeeds();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return FutureBuilder<ProductModel?>(
      future: getEveryDayNeeds,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.blue),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Connection error", style: AppStyles.medium20blue),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ApiManager.getEveryDayNeeds(); // إعادة المحاولة
                  });
                },
                child: Text("Please try again", style: AppStyles.medium20blue),
              ),
            ],
          );
        }
        if (snapshot.data!.status != "ok") {
          return Text("error");
        }
        List<Products?> everyDayProductList = snapshot.data!.products!;

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: everyDayProductList.length,
          itemBuilder: (context, index) {
            return productCardWidget(product: everyDayProductList[index]!,);
          },
        );
      },
    );
  }
}
