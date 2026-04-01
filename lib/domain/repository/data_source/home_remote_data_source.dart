import 'package:dartz/dartz.dart';
import 'package:graduation_project/Core/failures/failures.dart';
import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';

import '../../entities/ProductResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategory();
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
}
