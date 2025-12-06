class CategoriesModel {
  CategoriesModel({
      this.status, 
      this.categories,});

  CategoriesModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Category.fromJson(v));
      });
    }
  }
  String? status;
  List<Category>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Category {
  Category({
      this.id, 
      this.name, 
      this.logoUrl,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logoUrl = json['logoUrl'];
  }
  int? id;
  String? name;
  String? logoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['logoUrl'] = logoUrl;
    return map;
  }

}