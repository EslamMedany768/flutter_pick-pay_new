import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/use_case/get_products_use_case.dart';
import 'package:graduation_project/features/ui/tabs/allProducts_tab/cubit/product_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetProductsUseCase getAllProductsUseCase;

  ProductTabViewModel({required this.getAllProductsUseCase})
    : super(ProductTabLoadingState());

  getAllProducts() async {
    var either = await getAllProductsUseCase.invoke();
    either.fold(
      (error) {
        emit(ProductTabErrorState(error: error.errorName));
      },
      (response) {
        emit(ProductTabSuccessState(productResponse: response));
      },
    );
  }
}
