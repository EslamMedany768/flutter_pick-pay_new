import 'package:flutter/material.dart';
import '../../../model/WishlistModel.dart';

class WishlistCardWidget extends StatelessWidget {
  final WishlistItemDTO item;

  const WishlistCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(height: height * 0.16,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.withAlpha(80), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.network(
              width: width*0.28,
              item.pictureUrl, fit: BoxFit.contain),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: width * 0.5),
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  item.name ?? "",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Text("EGP ${item.price}", style: TextStyle(fontSize: 16)),
            ],
          ),

          Spacer(),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
