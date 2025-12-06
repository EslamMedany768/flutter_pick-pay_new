import 'package:flutter/material.dart';
import 'package:graduation_project/ui/tabs/category_tab/category_screen_tab.dart';
import 'package:graduation_project/ui/tabs/favourite_tab/rectangle_cardWidget.dart';
import 'package:graduation_project/widgets/searchTextfiled.dart';

import '../../../widgets/wishlist_icon.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(toolbarHeight: height * 0.03),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Searchtextfiled(hint: "what do you search for?"),
                ),
                SizedBox(width: width * 0.04),
                WishlistIcon(),
              ],
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: CategoryTab.productList.length,
            //
            //     itemBuilder: (context, index) {
            //       return RectangleCardWidget(
            //         product: CategoryTab.productList[index],
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
