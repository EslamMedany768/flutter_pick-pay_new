import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../model/ProductModel.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class productCardWidget extends StatelessWidget {
  Products product;

  productCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.4,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.only(left: 7, top: 10, right: 7),
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
                  height: height * 0.2,
                  imageUrl: product.pictureUrl ?? "",
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              // Image.network(
              //   ,
              //
              // ),
              // Container(
              //   width: width * 0.07,
              //   height: height * 0.04,
              //   child: IconButton(
              //     padding: EdgeInsets.zero,
              //     onPressed: () {},
              //     icon: product.isFav
              //         ? Icon(Icons.favorite, color: AppColors.blue)
              //         : Icon(Icons.favorite_border, color: AppColors.blue),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Expanded(
            child: Text(product.name ?? "", style: AppStyles.medium18blueDark),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("EGP ${product.price}", style: AppStyles.medium18blueDark),

              Container(
                width: width * 0.07,
                height: height * 0.04,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle,
                    color: AppColors.blue,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
