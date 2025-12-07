
class ProductToUpdateDTO {
  ProductToUpdateDTO({
    this.name,
    this.currentStock,
    this.price,
    this.isFav,
  });

  String? name;
  int? currentStock;
  double? price;        // decimal في .NET بيبقى double في Dart
  bool? isFav;

  // تحويل الكائن لـ JSON (بس الحقول اللي مش null)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (name != null) data['name'] = name;
    if (currentStock != null) data['currentStock'] = currentStock;
    if (price != null) data['price'] = price;
    if (isFav != null) data['isFav'] = isFav;

    return data;
  }

// لو عايز تستقبل رد من الـ API (اختياري)
// ProductToUpdateDTO.fromJson(Map<String, dynamic> json) {
//   name = json['name'];
//   currentStock = json['currentStock'];
//   price = json['price']?.toDouble();
//   isFav = json['isFav'];
// }
}