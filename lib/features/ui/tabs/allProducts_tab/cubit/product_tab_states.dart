import 'package:graduation_project/domain/entities/ProductResponseEntity.dart';

abstract class ProductTabStates {}

class ProductTabLoadingState extends ProductTabStates {}

class ProductTabSuccessState extends ProductTabStates {
  ProductResponseEntity productResponse;

  ProductTabSuccessState({required this.productResponse});
}

class ProductTabErrorState extends ProductTabStates {
  String error;

  ProductTabErrorState({required this.error});
}
