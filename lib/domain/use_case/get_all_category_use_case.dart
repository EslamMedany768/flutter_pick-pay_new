import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../Core/failures/failures.dart';
import '../entities/CategoryResponseEntity.dart';
import '../repository/repositories/home_repository.dart';

@injectable
class GetAllCategoryUseCase {
  HomeRepository homeRepository;

  GetAllCategoryUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryResponseEntity>> invoke() {
    return homeRepository.getAllCategory();
  }
}
