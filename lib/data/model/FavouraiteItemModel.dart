class FavouraitesDTO {
  final String status;
  final String id;
  final List<FavouraitesItemDTO> items;

  FavouraitesDTO({this.status = "Ok", required this.id, required this.items});

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'Id': id,
      'Items': items.map((e) => e.toJson()).toList(),
    };
  }
  factory FavouraitesDTO.fromJson(Map<String, dynamic> json) {
    return FavouraitesDTO(
      status: json['status'] ?? "Ok",
      id: json['id'].toString(),
      items: (json['items'] as List)
          .map((e) => FavouraitesItemDTO.fromJson(e))
          .toList(),
    );
  }

}

class FavouraitesItemDTO {
  final int productId;
  final String name;
  final String pictureUrl;
  final double price;


  FavouraitesItemDTO({
    required this.productId,

    required this.name,
    required this.pictureUrl,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'Name': name,
      'PictureUrl': pictureUrl,
      'Price': price,

    };
  }
  factory FavouraitesItemDTO.fromJson(Map<String, dynamic> json) {
    return FavouraitesItemDTO(
      productId: json['productId'],
      name: json['name'],
      pictureUrl: json['pictureUrl'],
      price: (json['price'] as num).toDouble(),

    );
  }

}
