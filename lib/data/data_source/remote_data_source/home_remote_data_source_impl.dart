import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/Core/api/end_points.dart';
import 'package:graduation_project/data/model/CategoryResponseDm.dart';
import 'package:graduation_project/data/model/ProductResponseDm.dart';
import 'package:graduation_project/domain/entities/ProductResponseEntity.dart';

import 'package:graduation_project/domain/repository/data_source/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../Core/api/api_manager.dart';
import '../../../Core/failures/failures.dart';
import '../../../domain/entities/CategoryResponseEntity.dart';
@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategory() async {
    try {
      var connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllCategory,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(CategoryResponseDm.fromJson(response.data));
        } else {
          return Left(
            ServerError(errorName: response.statusMessage.toString()),
          );
        }
      } else {
        return Left(NetworkError(errorName: "Please check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async{
    try {
      var connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllProducts,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(ProductResponseDm.fromJson(response.data));
        } else {
          return Left(
            ServerError(errorName: response.statusMessage.toString()),
          );
        }
      } else {
        return Left(NetworkError(errorName: "Please check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }
}
//   Future<Either<Failures, ProductResponseEntity>> getProductsByCategoryId(int CategoryId) async{
//
//       var connectionResult = await Connectivity().checkConnectivity();
//       if (connectionResult.contains(ConnectivityResult.wifi) ||
//           connectionResult.contains(ConnectivityResult.mobile)) {
//         var response = await apiManager.postData(
//           endPoint: EndPoints.getAllProducts,
//           queryParameters: {
//             "CategoryId":CategoryId
//           }
//         );
//         if (response.statusCode! >= 200 && response.statusCode! < 300) {
//           return Right(ProductResponseDm.fromJson(response.data));
//         } else {
//           return Left(
//             ServerError(errorName: response.statusMessage.toString()),
//           );
//         }
//       } else {
//         return Left(NetworkError(errorName: "Please check your internet"));
//       }
//     } catch (e) {
//       return Left(Failures(errorName: e.toString()));
//     }}
