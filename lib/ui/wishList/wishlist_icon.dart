import 'package:flutter/material.dart';
import 'package:graduation_project/ui/wishList/WishListScreen.dart';

class WishlistIcon extends StatelessWidget {
  const WishlistIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height * 0.01),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(WishListScreen.routeName);
          },
          child: Image.asset(
            width: width * 0.12,
            height: height * 0.09,
            "assets/images/wishlist_Icon.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
