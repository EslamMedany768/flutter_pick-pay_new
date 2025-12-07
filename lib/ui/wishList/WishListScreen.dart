import 'package:flutter/material.dart';
import 'package:graduation_project/ui/tabs/favourite_tab/rectangle_cardWidget.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = "wishListScreen";

  WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.blue),
        title: Text("Wishlist", style: AppStyles.medium20blueDark),
        centerTitle: true,
      ),
      // body: ListView.builder(
      //   padding: EdgeInsets.symmetric(horizontal: 13, vertical: 30),
      //   itemCount: CategoryTab.productList.length,
      //   itemBuilder: (context, index) {
      //     return RectangleCardWidget(
      //       product: CategoryTab.productList[index],
      //       inWishList: true,
      //     );
      //   },
      // ),
    );
  }
}
