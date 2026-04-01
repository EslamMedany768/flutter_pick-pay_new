import 'package:graduation_project/domain/entities/ProductResponseEntity.dart';

class ProductResponseDm extends ProductResponseEntity {
  ProductResponseDm({super.status, super.products});

  ProductResponseDm.fromJson(dynamic json) {
    status = json['status'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductDm.fromJson(v));
      });
    }
  }
}

class ProductDm extends ProductsEntity {
  ProductDm({
    super.id,
    super.name,
    super.weight,
    super.pictureUrl,
    super.price,
    super.currentStock,
    super.categoryId,
  });

  ProductDm.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    weight = json['weight'];
    pictureUrl = json['pictureUrl'];
    price = json['price'];
    currentStock = json['currentStock'];
    categoryId = json['categoryId'];
  }
}
