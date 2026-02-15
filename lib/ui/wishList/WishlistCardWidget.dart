import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/utils/app_colors.dart';
import '../../data/model/WishlistModel.dart';

class WishlistCardWidget extends StatefulWidget {
  final WishlistItemDTO item;
  final Function()? onDelete; // callback اختياري للتحديث من parent

  const WishlistCardWidget({super.key, required this.item, this.onDelete});

  @override
  State<WishlistCardWidget> createState() => _WishlistCardWidgetState();
}

class _WishlistCardWidgetState extends State<WishlistCardWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    ApiManager apiManager = ApiManager();

    return Container(
      height: height * 0.16,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.withAlpha(80), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          // صورة المنتج
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
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          const SizedBox(width: 8),

          // النصوص
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "EGP ${widget.item.price.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "Quantity: ${widget.item.quantity}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),

          // زر الحذف
          IconButton(
            onPressed: () async {
              try {
                await apiManager.deleteFromWishlist(
                  userId: 1, // حط اليوزر الحقيقي
                  productId: widget.item.productId!,
                );

                // إزالة العنصر من القائمة فوراً
                if (widget.onDelete != null) {
                  widget.onDelete!(); // callback للـ parent
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Item removed successfully")),
                );
              } catch (e) {
                print("Delete error: $e");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Failed to remove item")),
                );
              }
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
