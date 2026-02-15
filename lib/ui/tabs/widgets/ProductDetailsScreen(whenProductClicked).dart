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

import 'package:graduation_project/ui/tabs/home_tab/EveryDayNeedsProduct/getEveryDayProducts.dart';
import 'package:graduation_project/ui/tabs/widgets/productCardwidget.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';
import '../../../admin&tablet/admin/model/product_model.dart';
import '../../../api/api_manager.dart';
import '../../../data/model/WishlistModel.dart';
import 'add_or_remove_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "ProductDetails";

  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    ApiManager apiManager = ApiManager();
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
              child: Center(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: height * 0.321,
                  imageUrl: args.pictureUrl ?? "",
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
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
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                height: height * 0.052,
                width: width * 0.330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        removeFunc();
                        setState(() {});
                      },
                      child: Icon(Icons.remove_circle, color: AppColors.white),
                    ),
                    Text("$count", style: AppStyles.extraBold18white),
                    InkWell(
                      onTap: () {
                        addFunc();
                        setState(() {});
                      },
                      child: Icon(Icons.add_circle, color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
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
                    onPressed: () async {
                      // 1️⃣ إنشاء عنصر wishlist من المنتج الحالي
                      WishlistItemDTO item = WishlistItemDTO(
                        productId: args.productId!,
                        name: args.name!,
                        pictureUrl: args.pictureUrl!.replaceAll(
                          "localhost:7149",
                          "pickandpaydeploy.runasp.net",
                        ),
                        // لو فيه localhost
                        price: args.price!,
                        quantity: count, // العدد اللي عايز تضيفه
                      );

                      // 2️⃣ استدعاء الفانكشن اللي بتتعامل مع الـ wishlist
                      await apiManager.addItemToWishlist(item);

                      // 3️⃣ تحديث الشاشة
                      setState(() {});

                      // 4️⃣ اظهار رسالة للمستخدم
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Wishlist updated successfully"),
                        ),
                      );
                    },
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

  addFunc() {
    count++;
  }

  removeFunc() {
    if (count == 1) {
      return;
    } else {
      count--;
    }
  }
}
