import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/use_case/get_all_category_use_case.dart';
import 'package:graduation_project/features/ui/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;

  HomeTabViewModel({required this.getAllCategoryUseCase})
    : super(HomeTabLoadingState());

  getAllCategory() async {
    var either = await getAllCategoryUseCase.invoke();
    return either.fold(
      (error) {
        emit(GetCategoryErrorState(error: error.errorName));
      },
      (response) {
        emit(GetCategorySuccessState(categoryResponse: response));
      },
    );
  }
}
