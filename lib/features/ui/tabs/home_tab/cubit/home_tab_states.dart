import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class GetCategorySuccessState extends HomeTabStates {
  CategoryResponseEntity categoryResponse;

  GetCategorySuccessState({required this.categoryResponse});
}

class GetCategoryErrorState extends HomeTabStates {
  String error;

  GetCategoryErrorState({required this.error});
}
