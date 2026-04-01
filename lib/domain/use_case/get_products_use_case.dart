import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/entities/ProductResponseEntity.dart';
import 'package:injectable/injectable.dart';
import '../../Core/failures/failures.dart';
import '../entities/CategoryResponseEntity.dart';
import '../repository/repositories/home_repository.dart';

@injectable
class GetProductsUseCase {
  HomeRepository homeRepository;

  GetProductsUseCase({required this.homeRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeRepository.getAllProducts();
  }
}
