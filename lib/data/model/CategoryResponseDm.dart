import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';

class CategoryResponseDm extends CategoryResponseEntity {
  CategoryResponseDm({super.status, super.categories});

  CategoryResponseDm.fromJson(dynamic json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(CategoryDm.fromJson(v));
      });
    }
  }
}

class CategoryDm extends CategoryEntity {
  CategoryDm({super.id, super.name, super.logoUrl});

  CategoryDm.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logoUrl = json['logoUrl'];
  }
}
