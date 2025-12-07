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
}
