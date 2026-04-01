import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';
import '../../data/model/WishlistModel.dart';
import 'WishlistCardWidget.dart';

class WishListScreen extends StatefulWidget {
  static const String routeName = "wishListScreen";

  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List<WishlistItemDTO> wishlistItems = [];
  bool isLoading = true;
  ApiManager apiManager = ApiManager();

  @override
  void initState() {
    super.initState();
    loadWishlist();
  }

  void loadWishlist() async {
    try {
      final data = await apiManager.getWishlistById("1"); // أو id حقيقي
      setState(() {
        wishlistItems = data?.items ?? [];
        isLoading = false;
      });
    } catch (e) {
      print("Error loading wishlist: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void deleteItem(int index) async {
    if (index >= wishlistItems.length) return; // safety check

    try {
      await apiManager.deleteFromWishlist(
        userId: 1,
        productId: wishlistItems[index].productId!,
      );

      // إزالة العنصر محلياً فوراً
      setState(() {
        wishlistItems.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Item removed successfully")),
      );
    } catch (e) {
      print("Delete error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to remove item")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist", style: AppStyles.semiBold20blue),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.blue),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: AppColors.blue))
          : wishlistItems.isEmpty
          ? const Center(child: Text("No items in wishlist"))
          : ListView.builder(
        padding:
        const EdgeInsets.symmetric(horizontal: 13, vertical: 30),
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return WishlistCardWidget(
            item: item,
            onDelete: () => deleteItem(index),
          );
        },
      ),
    );
  }
}
