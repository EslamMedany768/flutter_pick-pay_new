import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/model/ProductModel.dart';
import 'package:graduation_project/model/ProductUpdateModel.dart';

import '../../../model/FavouraiteItemModel.dart';

class RectangleCardWidget extends StatefulWidget {
  final FavouraitesItemDTO item;

  const RectangleCardWidget({super.key, required this.item});

  @override
  State<RectangleCardWidget> createState() => _RectangleCardWidgetState();
}

class _RectangleCardWidgetState extends State<RectangleCardWidget> {
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
          Image.network(
            widget.item.pictureUrl!,
            fit: BoxFit.contain,
            width: width * 0.279,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: width * 0.3),
                  child: Expanded(
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      widget.item.name!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: width * 0.5),
                  child: Expanded(
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      "EGP ${widget.item.price}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),

          IconButton(
            onPressed: () {
              var productToUpdate = ProductToUpdateDTO(
                name: widget.item.name,
                price: widget.item.price,
                currentStock:250,
                isFav: !widget.item.IsFav,
              );

              ApiManager.UpdateProduct(productToUpdate, widget.item.id);
              var fav = FavouraitesDTO(id: "1234", items: ApiManager.favouriteItems);
              var success = ApiManager.createOrUpdateFavourites(fav);
              setState(() {});
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
