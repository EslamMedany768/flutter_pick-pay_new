class CategoryResponseEntity {
  CategoryResponseEntity({
      this.status,
      this.categories,});


  String? status;
  List<CategoryEntity>? categories;



}

class CategoryEntity {
  CategoryEntity({
      this.id, 
      this.name, 
      this.logoUrl,});


  num? id;
  String? name;
  String? logoUrl;



}