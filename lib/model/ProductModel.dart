class ProductModel {
  ProductModel({
      this.status, 
      this.products,});

  ProductModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  String? status;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Products {
  Products({
      this.id, 
      this.name, 
      this.weight, 
      this.pictureUrl, 
      this.price, 
      this.currentStock, 
      this.categoryId,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    weight = json['weight'];
    pictureUrl = json['pictureUrl'];
    price = json['price'];
    currentStock = json['currentStock'];
    categoryId = json['categoryId'];
  }
  int? id;
  String? name;
  double? weight;
  String? pictureUrl;
  double? price;
  int? currentStock;
  int? categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['weight'] = weight;
    map['pictureUrl'] = pictureUrl;
    map['price'] = price;
    map['currentStock'] = currentStock;
    map['categoryId'] = categoryId;
    return map;
  }

}