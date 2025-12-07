import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/ui/tabs/widgets/ProductDetailsScreen(whenProductClicked).dart';

import '../../../model/FavouraiteItemModel.dart';
import '../../../model/ProductModel.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class productCardWidget extends StatefulWidget {
  Product product;

  productCardWidget({super.key, required this.product});

  @override
  State<productCardWidget> createState() => _productCardWidgetState();
}

class _productCardWidgetState extends State<productCardWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.routeName,
          arguments: widget.product,
        );
      },
      child: Container(
        width: width * 0.4,
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
                    imageUrl: widget.product.pictureUrl ?? "",
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),

                Container(
                  width: width * 0.07,
                  height: height * 0.04,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      FavouraitesItemDTO productItem = FavouraitesItemDTO(
                        id: widget.product.id!,
                        name: widget.product.name!,
                        pictureUrl: widget.product.pictureUrl!,
                        price: widget.product.price!,
                      );

                      if (widget.product.isFav) {
                        // DELETE
                        ApiManager.favouriteItems.removeWhere(
                          (item) => item.id == productItem.id,
                        );
                      } else {
                        // ADD
                        ApiManager.favouriteItems.add(productItem);
                      }

                      var dto = FavouraitesDTO(
                        id: "1234",
                        items: ApiManager.favouriteItems,
                      );

                      bool success = await ApiManager.createOrUpdateFavourites(
                        dto,
                      );

                      if (success) {
                        setState(() {
                          widget.product.isFav = !widget.product.isFav;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Failed to update favourites"),
                          ),
                        );
                      }
                    },
                    icon: widget.product.isFav
                        ? Icon(Icons.favorite, color: AppColors.blue)
                        : Icon(Icons.favorite_border, color: AppColors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: Text(
                maxLines: 2,

                widget.product.name ?? "",
                style: AppStyles.medium18blueDark,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "EGP ${widget.product.price}",
                  style: AppStyles.medium18blueDark,
                ),

                SizedBox(
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
      ),
    );
  }
}
