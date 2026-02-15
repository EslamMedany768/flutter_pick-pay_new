import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/ui/tabs/widgets/productCardwidget.dart';
import 'package:graduation_project/utils/app_colors.dart';


import '../../../../admin&tablet/admin/model/product_model.dart';
import '../../../../utils/app_styles.dart';

class getEveryDayProducts extends StatefulWidget {
  getEveryDayProducts({super.key});

  @override
  State<getEveryDayProducts> createState() => _getEveryDayProductsState();
}

class _getEveryDayProductsState extends State<getEveryDayProducts> {
  ApiManager apiManager =ApiManager();
  late Future<ProductModel?> getEveryDayNeeds;

  @override
  void initState() {
    // TODO: implement initState
    getEveryDayNeeds = apiManager.getEveryDayNeedsProducts();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                    apiManager.getEveryDayNeedsProducts(); // إعادة المحاولة
                  });
                },
                child: Text("Please try again", style: AppStyles.medium20blue),
              ),
            ],
          );
        }
        if (snapshot.data!.status != "Ok") {
          return Text("error");
        }
        List<Product?> everyDayProductList = snapshot.data!.products!;

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: everyDayProductList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 16),
              child: productCardWidget(product: everyDayProductList[index]!),
            );
          },
        );
      },
    );
  }
}
