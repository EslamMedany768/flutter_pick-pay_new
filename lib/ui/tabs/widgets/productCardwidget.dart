import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/ui/tabs/widgets/ProductDetailsScreen(whenProductClicked).dart';

import '../../../admin&tablet/admin/model/product_model.dart';
import '../../../data/model/FavouraiteItemModel.dart';
import '../../../data/model/WishlistModel.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class productCardWidget extends StatefulWidget {
  final Product product;

  productCardWidget({super.key, required this.product});

  @override
  State<productCardWidget> createState() => _productCardWidgetState();
}

class _productCardWidgetState extends State<productCardWidget> {
  List<FavouraitesItemDTO> favProductList = [];
  ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // دالة لتحديد إذا المنتج موجود في المفضلات
    bool isFavourite() {
      return favProductList.any(
              (item) => item.productId == widget.product.productId);
    }

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
                      try {
                        final response = await ApiManager.addToFavourites(
                          favouritesId: 1,
                          userId: 1,
                          productId: widget.product.productId!.toInt(),
                          pictureUrl: widget.product.pictureUrl!,
                          price: widget.product.price!,
                          name: widget.product.name!,
                        );

                        setState(() {
                          favProductList = response['items']
                              .map<FavouraitesItemDTO>(
                                  (item) => FavouraitesItemDTO.fromJson(item))
                              .toList();
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                              Text('Favourite list updated successfully!')),
                        );
                      } catch (e) {
                        print('Error: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Failed to update favourites')),
                        );
                      }
                    },
                    icon: Icon(
                      isFavourite()
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: Text(
                widget.product.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
                    onPressed: () async {
                      WishlistItemDTO item = WishlistItemDTO(
                        productId: widget.product.productId!,
                        name: widget.product.name!,
                        pictureUrl: widget.product.pictureUrl!,
                        price: widget.product.price!,
                        quantity: 1,
                      );

                      await apiManager.addItemToWishlist(item);

                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Wishlist updated successfully")),
                      );
                    },
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
