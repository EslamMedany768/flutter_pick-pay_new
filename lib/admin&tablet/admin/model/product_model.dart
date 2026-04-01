class ProductModel {
  ProductModel({this.status, this.products});

  ProductModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
  }

  String? status;
  List<Product>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Product {
  Product({
    this.productId,
    this.name,
    this.weight,
    this.pictureUrl,
    this.price,
    this.currentStock,
    this.categoryId,
    this.isFav = false, // 👈 اضفناه هنا
  });

  Product.fromJson(dynamic json) {
    productId = json['id'];
    name = json['name'];
    weight = json['weight'];
    pictureUrl = json['pictureUrl'];
    price = json['price'];
    currentStock = json['currentStock'];
    categoryId = json['categoryId'];
    isFav = json["isFav"];
    // isFav لا نقرأه من JSON
  }

  int? productId;
  String? name;
  double? weight;
  String? pictureUrl;
  double? price;
  int? currentStock;
  int? categoryId;

  bool isFav = false ; // 👈 متغير جديد للواجهة فقط

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = productId;
    map['name'] = name;
    map['weight'] = weight;
    map['pictureUrl'] = pictureUrl;
    map['price'] = price;
    map['currentStock'] = currentStock;
    map['categoryId'] = categoryId;
    // isFav مش هيتبعت
    return map;
  }
}
