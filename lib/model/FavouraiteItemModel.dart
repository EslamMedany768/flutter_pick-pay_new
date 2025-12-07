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
  final int id;
  final String name;
  final String pictureUrl;
  final double price;
  bool IsFav;

  FavouraitesItemDTO({
    required this.id,
    this.IsFav = false,
    required this.name,
    required this.pictureUrl,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PictureUrl': pictureUrl,
      'Price': price,
      'IsFav': IsFav,
    };
  }
  factory FavouraitesItemDTO.fromJson(Map<String, dynamic> json) {
    return FavouraitesItemDTO(
      id: json['id'],
      name: json['name'],
      pictureUrl: json['pictureUrl'],
      price: (json['price'] as num).toDouble(),
      IsFav: json['isFav'] ?? false,
    );
  }

}
