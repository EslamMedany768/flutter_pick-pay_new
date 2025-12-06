///لما تدوس علي الproductCardWidget بتطلع
///
///
///
///
///
///
///
import 'package:flutter/material.dart';
import 'package:graduation_project/model/ProductModel.dart';
import 'package:graduation_project/ui/tabs/category_tab/category_screen_tab.dart';
import 'package:graduation_project/ui/tabs/home_tab/EveryDayNeedsProduct/getEveryDayProduct.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';
import 'add_or_remove_button.dart';
class ProductDetails extends StatelessWidget {
  static const String routeName = "ProductDetails";

  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.blue),
        title: Text("Product Details", style: AppStyles.medium20blueDark),
        centerTitle: true,
      ),
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 12),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Productcardwidget(product: args),
      //       SizedBox(height: height * 0.02),
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 5),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(args.name, style: AppStyles.medium18blueDark),
      //             Text("EGP ${args.price}", style: AppStyles.medium18blueDark),
      //           ],
      //         ),
      //       ),
      //       SizedBox(height: height * 0.02),
      //       Align(alignment: Alignment.centerRight, child: AddOrRemoveButton()),
      //       SizedBox(height: height * 0.02),
      //       SizedBox(
      //         height: height * 0.276,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: CategoryTab.productList.length,
      //
      //           itemBuilder: (context, index) {
      //             return Container(
      //               margin: EdgeInsets.only(right: width * 0.034),
      //               height: height * 0.1,
      //               width: width * 0.367,
      //               child: CardWidget(product: CategoryTab.productList[index]),
      //             );
      //           },
      //         ),
      //       ),
      //       SizedBox(height: height * 0.05),
      //       Padding(padding: EdgeInsets.symmetric(horizontal: 5),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               textAlign: TextAlign.center,
      //               "Total price\n EGP ${args.price}",
      //               style: AppStyles.medium18grey,
      //             ),
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 padding: EdgeInsets.symmetric(vertical: 9, horizontal: 50),
      //                 backgroundColor: AppColors.blue,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.all(Radius.circular(25)),
      //                 ),
      //               ),
      //               onPressed: () {},
      //               child: Text(
      //                 "Add to Withlist",
      //                 style: AppStyles.medium20white,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
