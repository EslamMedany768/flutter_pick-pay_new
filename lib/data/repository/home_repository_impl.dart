import 'package:dartz/dartz.dart';
import 'package:graduation_project/Core/failures/failures.dart';
import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';
import 'package:graduation_project/domain/entities/ProductResponseEntity.dart';
import 'package:graduation_project/domain/repository/data_source/home_remote_data_source.dart';
import 'package:graduation_project/domain/repository/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategory() async {
    var either = await homeRemoteDataSource.getAllCategory();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts(

  ) async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
