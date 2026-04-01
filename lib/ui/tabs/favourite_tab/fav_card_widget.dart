import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';

import '../../../data/model/FavouraiteItemModel.dart';
import '../../../data/model/ProductUpdateModel.dart';
import '../../../utils/app_colors.dart';
import '../widgets/ProductDetailsScreen(whenProductClicked).dart';

class FavCardWidget extends StatefulWidget {
  final FavouraitesItemDTO item;

  const FavCardWidget({super.key, required this.item});

  @override
  State<FavCardWidget> createState() => _FavCardWidgetState();
}

class _FavCardWidgetState extends State<FavCardWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.15,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.withAlpha(80), width: 2),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.30,
            child: CachedNetworkImage(
              imageUrl: widget.item.pictureUrl,
              fit: BoxFit.contain,
              placeholder: (context, url) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.blue),
                );
              },
              errorWidget: (context, url, error) {
                return Icon(Icons.error);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: width * 0.3),
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    widget.item.name,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: width * 0.5),
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    "EGP ${widget.item.price} ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),

          IconButton(
              onPressed: () async {
                bool success = await ApiManager().deleteFromFavourites(
                  userId: 1,
                  favouritesId: 1,
                  productId: widget.item.productId,
                );

                if (success) {ApiManager.favouriteItems
                    .removeWhere((element) => element.productId == widget.item.productId);
                  setState(() {

                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Removed from favourites")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to delete")),
                  );
                }
              },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
