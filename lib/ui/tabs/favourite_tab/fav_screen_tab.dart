import 'package:flutter/material.dart';
import 'package:graduation_project/ui/tabs/favourite_tab/rectangle_cardWidget.dart';
import 'package:graduation_project/widgets/searchTextfiled.dart';

import '../../wishList/wishlist_icon.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
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
