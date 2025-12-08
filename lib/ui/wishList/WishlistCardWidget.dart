import 'package:flutter/material.dart';
import '../../../model/WishlistModel.dart';

class WishlistCardWidget extends StatelessWidget {
  final WishlistItemDTO item;

  const WishlistCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.withAlpha(80)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            height: height * 0.121,
            width: width * 0.279,
            child: Image.network(item.pictureUrl ?? "", fit: BoxFit.fill),
          ),
          SizedBox(width: width * 0.03),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name ?? "", style: TextStyle(fontSize: 18)),
              Text("EGP ${item.price}", style: TextStyle(fontSize: 16)),
            ],
          ),

          Spacer(),

          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
