class ProductResponseEntity {
  ProductResponseEntity({
      this.status, 
      this.products,});

  String? status;
  List<ProductsEntity>? products;



}

class ProductsEntity {
  ProductsEntity({
      this.id, 
      this.name, 
      this.weight, 
      this.pictureUrl, 
      this.price, 
      this.currentStock, 
      this.categoryId,});


  num? id;
  String? name;
  num? weight;
  String? pictureUrl;
  num? price;
  num? currentStock;
  num? categoryId;



}