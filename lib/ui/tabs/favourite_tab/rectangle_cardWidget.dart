// import 'package:flutter/material.dart';
// import 'package:graduation_project/ui/tabs/category_tab/model/product_model.dart';
// import 'package:graduation_project/utils/app_colors.dart';
// import 'package:graduation_project/utils/app_styles.dart';
//
// import '../category_tab/product_details_screen/add_or_remove_button.dart';
//
// class RectangleCardWidget extends StatelessWidget {
//   ProductModel product;
//   bool inWishList;
//
//   RectangleCardWidget({
//     super.key,
//     required this.product,
//     this.inWishList = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.blue.withAlpha(80)),
//         borderRadius: BorderRadius.all(Radius.circular(15)),
//       ),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: AppColors.blue.withAlpha(50)),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             height: height * 0.121,
//             width: width * 0.279,
//             child: Image.asset(product.image, fit: BoxFit.fill),
//           ),
//           SizedBox(width: width * 0.03),
//           Container(
//             height: height * 0.1,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   textAlign: TextAlign.center,
//                   product.name,
//                   style: AppStyles.medium18blueDark,
//                 ),
//                 Text("EGP ${product.price}", style: AppStyles.medium18blueDark),
//               ],
//             ),
//           ),
//           Spacer(),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             height: height * 0.12,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Container(
//                   height: height * 0.04,
//                   child: inWishList
//                       ? IconButton(
//                           padding: EdgeInsets.zero,
//                           onPressed: () {},
//                           icon: ImageIcon(
//                             size: 24,
//                             AssetImage("assets/images/trash_icon.png"),
//                             color: AppColors.blueDark,
//                           ),
//                         )
//                       : IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.favorite, color: AppColors.blue),
//                         ),
//                 ),
//                 inWishList
//                     ? Padding(
//                         padding: EdgeInsets.symmetric(vertical: 5),
//                         child: AddOrRemoveButton(),
//                       )
//                     : ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(
//                             vertical: 0,
//                             horizontal: 14,
//                           ),
//                           backgroundColor: AppColors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           "Add to Cart",
//                           style: AppStyles.medium14white,
//                         ),
//                       ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
