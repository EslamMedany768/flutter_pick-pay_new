class WishlistItemDTO {
  final int productId;
  final String name;
  final String pictureUrl;
  final double price;
  final int quantity;

  WishlistItemDTO({
    required this.productId,
    required this.name,
    required this.pictureUrl,
    required this.price,
    required this.quantity,
  });

  factory WishlistItemDTO.fromJson(Map<String, dynamic> json) {
    return WishlistItemDTO(
      productId: json['productId'] ?? 0,
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 1,
      pictureUrl: json['pictureUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "name": name,
      "pictureUrl": pictureUrl,
      "price": price,
      "quantity": quantity,
    };
  }
}

class WishlistDTO {
  final List<WishlistItemDTO> items;

  WishlistDTO({required this.items});

  factory WishlistDTO.fromJson(Map<String, dynamic> json) {
    return WishlistDTO(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => WishlistItemDTO.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "items": items.map((e) => e.toJson()).toList(),
    };
  }
}


