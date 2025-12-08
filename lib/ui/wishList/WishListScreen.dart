import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/model/WishlistModel.dart';
import 'WishlistCardWidget.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = "wishListScreen";

  final String wishlistId = "12345"; // هتها من login أو storage

  WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist"), centerTitle: true),
      body: FutureBuilder<WishlistDTO?>(
        future: ApiManager.getWishlistById(wishlistId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("No items in wishlist"));
          }

          var wishlist = snapshot.data;

          if (wishlist == null ||
              wishlist.items == null ||
              wishlist.items.isEmpty) {
            return Center(child: Text("No items in wishlist"));
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 30),
            itemCount: wishlist.items.length,
            itemBuilder: (context, index) {
              return WishlistCardWidget(item: wishlist.items[index]);
            },
          );
        },
      ),
    );
  }
}
