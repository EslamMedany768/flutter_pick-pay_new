import 'package:flutter/material.dart';

import 'package:graduation_project/ui/tabs/category_tab/product_details_screen/onProductDetailsClicked.dart';

import '../../../model/ProductModel.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/searchTextfiled.dart';
import '../../../widgets/wishlist_icon.dart';
import 'getAllProducts.dart';

class CategoryTab extends StatelessWidget {
  CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.04,
        title: Text("Pick & Pay", style: AppStyles.extraBold24Blue),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Searchtextfiled(hint: "what do you search for?"),
                ),
                SizedBox(width: width * 0.03),
                WishlistIcon(),
              ],
            ),
            Getallproducts(),
          ],
        ),
      ),
    );
  }
}
