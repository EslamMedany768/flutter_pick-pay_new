///لما تدوس علي الproductCardWidget بتطلع
///
///
///
///
///
///
///
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/model/ProductModel.dart';
import 'package:graduation_project/ui/tabs/home_tab/EveryDayNeedsProduct/getEveryDayProducts.dart';
import 'package:graduation_project/ui/tabs/widgets/productCardwidget.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';
import 'add_or_remove_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "ProductDetails";

  ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Product;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.blue),
        title: Text("Product Details", style: AppStyles.medium20blueDark),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 7, top: 10, right: 7, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.blue, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: height * 0.321,
                          imageUrl: args.pictureUrl ?? "",
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 1,
                      "${args.name}",
                      style: AppStyles.medium18blueDark,
                    ),
                  ),
                  Text("EGP ${args.price}", style: AppStyles.medium18blueDark),
                ],
              ),
            ),
            SizedBox(height: height * 0.015),
            Align(alignment: Alignment.centerRight, child: AddOrRemoveButton()),
            SizedBox(height: height * 0.02),
            SizedBox(height: height * 0.3, child: getEveryDayProducts()),
            SizedBox(height: height * 0.022),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Total price\n EGP ${args.price}",
                    style: AppStyles.medium18grey,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: 50,
                      ),
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add to Withlist",
                      style: AppStyles.medium20white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
