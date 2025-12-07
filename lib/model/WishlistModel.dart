class WishlistDTO {
  final String status;
  final String id;
  final List<WishlistItemDTO> items;

  WishlistDTO({this.status = "Ok", required this.id, required this.items});

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'id': id,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  factory WishlistDTO.fromJson(Map<String, dynamic> json) {
    return WishlistDTO(
      status: json['status'] ?? "Ok",
      id: json['id'].toString(),
      items: (json['items'] as List)
          .map((e) => WishlistItemDTO.fromJson(e))
          .toList(),
    );
  }
}


class WishlistItemDTO {
  final int id;
  final String name;
  final String pictureUrl;
  final double price;
  int quantity;

  WishlistItemDTO({
    required this.id,
    this.quantity = 1,
    required this.name,
    required this.pictureUrl,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'pictureUrl': pictureUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  factory WishlistItemDTO.fromJson(Map<String, dynamic> json) {
    return WishlistItemDTO(
      id: json['id'],
      name: json['name'],
      pictureUrl: json['pictureUrl'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] ?? 1,
    );
  }
}

